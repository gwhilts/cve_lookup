# Copyright (c) 2024 Gerald Hilts
# License MIT (https://github.com/gwhilts/cve_lookup/blob/main/LICENSE)

require 'test_helper'

##
# The test is a 'black box' view of the application.
# It executes the script from a shell command and
# examines its output and the file system to validate
# the app performed correctly.
##

describe 'help' do
  before do
    clear_test_results
  end

  describe 'running `cve` without a command' do
    before do
      @io = `#{executable}`
    end

    it 'displays an error message' do
      _(@io).must_include "Error: unknown or missing command"
    end

    
    it 'displays usage instructions' do
      _(@io).must_include 'Usage: cve <search|help|legal> [product] [version]'
    end
  end

  describe 'running `cve help`' do
    before do
      @io = `#{executable} help`
    end
    
    it 'displays usage instructions' do
      _(@io).must_include 'Usage: cve <search|help|legal> [product] [version]'
    end
  end

  describe 'running `cve` with an unknown command' do
    before do
      @io = `#{executable} fubar`
    end

    it 'displays an error message' do
      _(@io).must_include "Error: unknown or missing command"
    end

    it 'displays usage instructions' do
      _(@io).must_include 'Usage: cve <search|help|legal> [product] [version]'
    end
  end

  def executable
    File.expand_path(File.join(APP_ROOT, 'bin/cve'))
  end
end