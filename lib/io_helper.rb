# (c) 2024 Gerald Hilts
# License: MIT (https://github.com/gwhilts/cve_lookup/blob/main/LICENSE)

class IOHelper
  require "io/console"

  def initialize(test_mode = false)
    @test = test_mode
  end
  
  def request(prompt, test_val = "TEST")
    unless @test
      print "#{prompt} "
      $stdin.gets.chomp
    else
      test_val
    end
  end

  def request_from_range(range, test_val = 0)
    unless @test
      response = ""
      until (response.match /^(\d+|X)/) && (range.include? response.to_i) do
        response = request("#{range.first} - #{range.last}: ")
      end
      response
    else
      test_val
    end
  end
end