# Third Party Materials and License Info

## Data from the NIST NVD

The CVE Lookup Utility uses application programming interfaces (APIs) to retreive information from the National Vulnerability Database (NVD), a U.S. government repository of standards based vulnerability management data.

This data is made available by the National Institute of Standards and Technology (NIST) as a "as a public service" with the following legal disclaimer:

> The National Vulnerability Database (NVD) is a repository of standards based vulnerability data. The Database is maintained by the National Institute of Standards and Technology (NIST), an agency of the Federal Government, and is being provided as a public service. Much of the data in NVD records is derived from publicly available data sources, including product information and manufacturer/developer information. NIST does not evaluate, review, or test software or code contained within the NVD.
> The NVD is expressly provided “AS IS.” NIST MAKES NO WARRANTY OF ANY KIND, EXPRESS, IMPLIED OR STATUTORY, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, NON-INFRINGEMENT, AND DATA ACCURACY. NIST does not warrant or make any representations regarding the use of the NVD, its contents, or the results obtained therefrom, including but not limited to the correctness, accuracy, reliability, or usefulness of the NVD.
> You are solely responsible for determining the appropriateness of your use of the NVD and its contents and you assume all risks associated with its use.

(see https://nvd.nist.gov/general/legal-disclaimer)

The CVE Lookup Utility is not endorsed or certified by the NVD.

## Ruby Gems

Although not present in these materials themselves, CVE Lookup Utility relies on the following Ruby Gem libraries. If these libraries are not already present in the user's environment, they may be downloaded (along with any upstream dependencies) when installing the CVE Lookup Utility using the `gem` command.

Gem Name | Copyright | License | URL
-------- | --------- | ------- | ---
HTTParty | Copyright (c) 2008 John Nunemaker | [MIT](https://github.com/jnunemaker/httparty/blob/main/MIT-LICENSE) | https://github.com/jnunemaker/httparty |


When using the `bundle` command to setup up a development enviornment, these following libraries will also be installed.

Gem Name | Copyright | License | URL
-------- | --------- | ------- | ---
minitest | Copyright (c) Ryan Davis, seattle.rb | [MIT](https://github.com/minitest/minitest#license-) | https://github.com/minitest/minitest
minitest-reporters | Copyright (c) 2018 Alexander Kern | [MIT](https://github.com/minitest-reporters/minitest-reporters/blob/master/LICENSE) | https://github.com/minitest-reporters/minitest-reporters
color_pound_spec_reporter | Copyright (c) 2015 Daniel P. Clark | [MIT](https://github.com/danielpclark/color_pound_spec_reporter/blob/master/LICENSE.txt) |https://github.com/danielpclark/color_pound_spec_reporter


See _GEMFILE_ and _GEMFILE.lock_ for version info and other details.