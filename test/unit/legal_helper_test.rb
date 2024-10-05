# (c) 2024 Gerald Hilts
# License: MIT (https://github.com/gwhilts/cve_lookup/blob/main/LICENSE)

require 'test_helper'
require 'legal_helper'

describe '.license' do
  it 'returns the CVE Lookup Utility License' do
    _(LegalHelper.license).must_include 'The above copyright notice and this permission notice shall be included'
  end
end

describe '.nvd_info' do
  it 'returns the NIST NVD info' do
    _(LegalHelper.nvd_info).must_include 'being provided as a public service'
  end
end