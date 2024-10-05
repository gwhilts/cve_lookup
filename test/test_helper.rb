# (c) 2024 Gerald Hilts
# License: MIT (https://github.com/gwhilts/cve_lookup/blob/main/LICENSE)

require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/reporters'
require 'color_pound_spec_reporter'

Minitest::Reporters.use! [ColorPoundSpecReporter.new]

APP_ROOT = File.expand_path File.join(__FILE__, "../..")
CPE_NAME = 'cpe:2.3:a:jquery:jquery:2.1.2:*:*:*:*:*:*:*'
CPE_URI = 'https://services.nvd.nist.gov/rest/json/cpes/2.0?cpeMatchString=cpe:2.3:*:*:jquery:2.1.2'
CVE_LIST = ["CVE-2020-11022", "CVE-2020-11023", "CVE-2019-11358", "CVE-2015-9251"]
PRODUCT_NAME = 'jquery'
PRODUCT_VERSION = '2.1.2'

def clear_test_results
  `rm -rf #{APP_ROOT}/test/test_results/*`
end