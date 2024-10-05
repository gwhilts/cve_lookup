# (c) 2024 Gerald Hilts
# License: MIT (https://github.com/gwhilts/cve_lookup/blob/main/LICENSE)

class Search
  require 'io_helper'
  require 'nvd_helper'

  def initialize(product, version, test_mode = false)
    @cpe_name = ""
    @cpe_title = ""
    @product = product
    @version = version
    @io = IOHelper.new(test_mode)
  end

  def run()
    set_product_name
    set_version
    select_cpe
    present_cve_list
  end

  def set_product_name
     @product = @product || @io.request('Product name:')
  end

  def set_version
    @version = @version || @io.request('Version number:')
  end

  def select_cpe
    puts "Searching CPE Dictionary for : #{@product} v#{@version} ...\n--\n"
    
    cpe_list = NVDHelper.cpe_list_for(@product, @version)
    
    if cpe_list.count > 0
      puts "Please select a product:\n\n"
      cpe_list.each_with_index do |cve, i|
        puts "#{i}: #{cve[:title]} (#{cve[:cpe_name]}"
      end
      puts "X: eXit and try again.\n\n"
    else
      puts "Unable to locate any entries for #{@product} v#{@version} in the CPE Dictionary."
      puts 'Please try again.'
      exit 0
    end

    case index = @io.request_from_range(0..(cpe_list.count - 1))
    when "X"
      exit 0
    else
      @cpe_title = cpe_list[index.to_i][:title]
      @cpe_name = cpe_list[index.to_i][:cpe_name]
    end
    
  end

  def present_cve_list
    cve_list = NVDHelper.cve_list_for(@cpe_name)
    
    puts "\n--\nSearching Nist National Vulnerability Database for #{@cpe_title}\n\n"
    case cve_list.count
    when 0
      puts "Unable to located any CVEs for #{@product} v#{@version}."
    when 1
      puts "The following CVE is associated with #{@product} v#{@version}:\n\n"
      puts cve_list.map { |cve| "https://nvd.nist.gov/vuln/detail/#{cve}" }
    else
      puts "The following CVEs are associated with #{@product} v#{@version}:\n\n"
      puts cve_list.map { |cve| "https://nvd.nist.gov/vuln/detail/#{cve}" }
    end
  end
end