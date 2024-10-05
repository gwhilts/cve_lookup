# (c) 2024 Gerald Hilts
# License: MIT (https://github.com/gwhilts/cve_lookup/blob/main/LICENSE)

class LegalHelper
  def self.license
    File.read(File.join(File.expand_path(File.join(File.realpath(__FILE__), "../..")), "LICENSE"))
  end

  def self.nvd_info
    <<~END_QUOTE
    NIST NVD
    ========

    The CVE Lookup Utility uses application programming interfaces (APIs) to 
    retreive information from the National Vulnerability Database (NVD), a U.S. 
    government repository of standards based vulnerability management data.

    This data is made available by the National Institute of Standards and 
    Technology (NIST) as a "as a public service" with the following legal 
    disclaimer:

      The National Vulnerability Database (NVD) is a repository of standards based 
      vulnerability data. The Database is maintained by the National Institute of 
      Standards and Technology (NIST), an agency of the Federal Government, and is 
      being provided as a public service. Much of the data in NVD records is derived 
      from publicly available data sources, including product information and 
      manufacturer/developer information. NIST does not evaluate, review, or test 
      software or code contained within the NVD. The NVD is expressly provided 
      “AS IS.” NIST MAKES NO WARRANTY OF ANY KIND, EXPRESS, IMPLIED OR STATUTORY, 
      INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS 
      FOR A PARTICULAR PURPOSE, NON-INFRINGEMENT, AND DATA ACCURACY. NIST does not 
      warrant or make any representations regarding the use of the NVD, its contents, 
      or the results obtained therefrom, including but not limited to the correctness, 
      accuracy, reliability, or usefulness of the NVD. You are solely responsible for 
      determining the appropriateness of your use of the NVD and its contents and you
      assume all risks associated with its use.
    
    (see https://nvd.nist.gov/general/legal-disclaimer)

    The CVE Lookup Utility is not endorsed or certified by the NVD.
    END_QUOTE
  end

  def self.third_party_info
    <<~END_QUOTE
    Ruby Gems
    =========

    Although not present in the code itself, various Ruby Gem libraries 
    that CVE Lookup Utility rely upon may be installed along with it
    if they are not already present in the user's environment.

    These libraries are released under various licenses. See
    
      https://github.com/gwhilts/cve_lookup/blob/main/THIRD_PARTY.md

    for more details.
    END_QUOTE
  end

  def self.print_info
    puts "\n"
    puts license
    puts "\n(https://github.com/gwhilts/cve_lookup/blob/main/LICENSE)\n\n"
    puts nvd_info
    puts "\n\n"
    puts third_party_info
  end
  
end