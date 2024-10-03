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
  end

  describe '.cpe_list_for' do
    it ' queries the NVD for CPEs matching a given product name and version' do
      products = NVDHelper.cpe_list_for(@product_name, @product_version)
      _(products.map { |p| p[:cpeName] }).must_include @cpe_name
    end
  end

  describe '.cpe_uri' do
    it ' returns the URI to query the cpe search API with a given product name and version' do
      _(NVDHelper.cpe_uri('jquery', '2.1.2')).must_equal @uri
    end
  end
end