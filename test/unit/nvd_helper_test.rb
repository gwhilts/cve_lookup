# (c) 2024 Gerald Hilts
# License: MIT (https://github.com/gwhilts/cve_lookup/blob/main/LICENSE)

require 'test_helper'
require 'nvd_helper'

describe NVDHelper do
  # Note: these tests performs a live query to the NVD CPE Dictionary. Expected results may need to be updated if the NVD data changes.

  before do
    @product_name = 'jquery'
    @product_version = '2.1.2'
    @uri = 'https://services.nvd.nist.gov/rest/json/cpes/2.0?cpeMatchString=cpe:2.3:*:*:jquery:2.1.2'
    @cpe_name = 'cpe:2.3:a:jquery:jquery:2.1.2:*:*:*:*:*:*:*'
    @results = nil
    @cve_list = ["CVE-2020-11022", "CVE-2020-11023", "CVE-2019-11358", "CVE-2015-9251"]
  end

  describe '.cpe_list_for(name, version)' do
    before do
      @results = NVDHelper.cpe_list_for(@product_name, @product_version)
    end

    it ' returns an Array of Hashes (if any)' do
      _(@results.class).must_equal Array
      if @results.size > 0
        _(@results[0].class).must_equal Hash
      end
    end

    it ' queries the NVD for CPEs matching a given product name and version' do
      _(@results.map { |p| p[:cpeName] }).must_include @cpe_name
    end
  end

  describe '.cpe_uri(name, version)' do
    it ' returns the URI to query the cpe search API with a given product name and version' do
      _(NVDHelper.cpe_uri('jquery', '2.1.2')).must_equal @uri
    end
  end

  describe '.cve_list_for(cpe_name)' do
    before do
      @results = NVDHelper.cve_list_for(@cpe_name)
    end
    it ' queries the NVD for all CVEs matching a given CPE' do
      _(@results.size).must_be :>=, 4
      _(@results).must_include "CVE-2019-11358"
    end
  end

  describe '.detail_urls_for(cve_list)' do
    before do 
      @results = NVDHelper.detail_urls_for(@cve_list)
    end

    it ' converts a list of CVE names into a list of URLs to their details' do
      _(@results.size).must_equal @cve_list.size
      _(@results).must_include "https://nvd.nist.gov/vuln/detail/CVE-2019-11358"
    end
  end
end