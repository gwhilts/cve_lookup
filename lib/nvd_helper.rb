# (c) 2024 Gerald Hilts
# License: MIT (https://github.com/gwhilts/cve_lookup/blob/main/LICENSE)

class NVDHelper
  require 'httparty'

  NIST_API_SERVER = "https://services.nvd.nist.gov"
  NIST_CVE_URL_BASE = "https://nvd.nist.gov/vuln/detail/"

  def self.cpe_list_for(name, version)
    HTTParty.get(cpe_uri(name, version))['products'].map do |p|
      { title: p['cpe']['titles'][0]['title'], cpeName: p['cpe']['cpeName'] }
    end
  end

  def self.cpe_uri(name, version)
    "#{NIST_API_SERVER}/rest/json/cpes/2.0?cpeMatchString=cpe:2.3:*:*:#{name}:#{version}"
  end

  def self.cve_list_for(cpe_name)
    HTTParty.get(cve_uri(cpe_name))["vulnerabilities"].map { |v| v["cve"]["id"] }
  end

  def self.cve_uri(cpe_name)
    "#{NIST_API_SERVER}/rest/json/cves/2.0?cpeName=#{cpe_name}"
  end

  def self.detail_urls_for(cve_list)
    cve_list.map { |cve| NIST_CVE_URL_BASE + cve }
  end

end