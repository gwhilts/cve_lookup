# Copyright (c) 2024 Gerald Hilts
# License MIT (https://github.com/gwhilts/cve_lookup/blob/main/LICENSE)

require 'test_helper'

##
# The test is a 'black box' view of the application.
# It executes the script from a shell command and
# examines its output and the file system to validate
# the app performed correctly.
##

describe 'running `cve legal`' do
  before do
    clear_test_results
    @io = `#{executable} legal`
  end

  it 'displays the CVE Lookup Utility License' do
    _(@io).must_include 'The above copyright notice and this permission notice shall be included'
  end

  it 'displays the NIST NVD info' do
    _(@io).must_include 'being provided as a public service'
  end

  it 'displays Ruby Gems info with link' do
    _(@io).must_include 'https://github.com/gwhilts/cve_lookup/blob/main/THIRD_PARTY.md'
  end

  def executable
    File.expand_path(File.join(APP_ROOT, 'bin/cve'))
  end
end