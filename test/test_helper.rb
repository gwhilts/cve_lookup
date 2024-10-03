# (c) 2024 Gerald Hilts
# License: MIT (https://github.com/gwhilts/cve_lookup/blob/main/LICENSE)

require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/reporters'
require 'color_pound_spec_reporter'

Minitest::Reporters.use! [ColorPoundSpecReporter.new]

def clear_test_results
  `rm -rf #{APP_ROOT}/test/test_results/*`
end