# (c) 2024 Gerald Hilts
# License: MIT (https://github.com/gwhilts/cve_lookup/blob/main/LICENSE)

class NVDHelper
  require 'httparty'

  NIST_API_SERVER = "https://services.nvd.nist.gov"

  def self.cpe_list_for(name, version)
    HTTParty.get(cpe_uri(name, version))['products'].map do |p|
      { title: p['cpe']['titles'][0]['title'], cpeName: p['cpe']['cpeName'] }
    end
  end

  def self.cpe_uri(name, version)
    "#{NIST_API_SERVER}/rest/json/cpes/2.0?cpeMatchString=cpe:2.3:*:*:#{name}:#{version}"
  end

  def self.cve_list_for(cpeName)
    HTTParty.get(cve_uri(cpeName))["vulnerabilities"].map { |v| v["cve"]["id"] }
  end

  def self.cve_uri(cpeName)
    "#{NIST_API_SERVER}/rest/json/cves/2.0?cpeName=#{cpeName}"
  end

end