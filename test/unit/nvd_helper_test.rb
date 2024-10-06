# (c) 2024 Gerald Hilts
# License: MIT (https://github.com/gwhilts/cve_lookup/blob/main/LICENSE)

require 'test_helper'
require 'nvd_helper'

describe NVDHelper do
  # Note: these tests perform a live query to the NVD CPE Dictionary. Expected results may need to be updated if the NVD data changes.

  before do
    @results = nil
  end

  describe '.cpe_list_for(name, version)' do
    before do
      @results = NVDHelper.cpe_list_for(PRODUCT_NAME, PRODUCT_VERSION)
    end

    it ' queries the NVD for CPEs matching a given product name and version' do
      _(@results.map { |p| p[:cpe_name] }).must_include CPE_NAME
    end
  end

  describe '.cpe_uri(name, version)' do
    it ' returns the URI to query the cpe search API with a given product name and version' do
      _(NVDHelper.cpe_uri('jquery', '2.1.2')).must_equal CPE_URI
    end
  end

  describe '.cve_list_for(cpe_name)' do
    before do
      @results = NVDHelper.cve_list_for(CPE_NAME)
    end
    it ' queries the NVD for all CVEs matching a given CPE' do
      _(@results.size).must_be :>=, 4
      _(@results).must_include "CVE-2019-11358"
    end
  end

  describe '.detail_urls_for(cve_list)' do
    before do 
      @results = NVDHelper.detail_urls_for(CVE_LIST)
    end

    it ' converts a list of CVE names into a list of URLs to their details' do
      _(@results.size).must_equal CVE_LIST.size
      _(@results).must_include "https://nvd.nist.gov/vuln/detail/CVE-2019-11358"
    end
  end
end