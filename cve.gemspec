Gem::Specification.new do |spec|
  spec.name = "cve"
  spec.version = `git tag --sort="version:refname"`.split("\n").last
  spec.date = Time.new.strftime("%Y-%m-%d")
  spec.summary = "CVE Lookup Utility"
  spec.description = "Command-line tool to search the NIST National Vulnerability Database for CVE reports associated with a specific product and version."
  spec.authors = ["Gerald Hilts"]
  spec.email = ["gwhilts@booknowl.com"]
  spec.homepage = "https://github.com/gwhilts/cve"
  spec.files = Dir["README.md", "Gemfile", "Rakefile", "{bin,lib}/**/*"]
  spec.executables << "cve"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0"
  spec.add_runtime_dependency "gems", "~> 1.2", ">= 1.2.0"
  spec.add_runtime_dependency "httparty", "~> 0.22", ">= 0.22.0"
end