# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "countries/version"

Gem::Specification.new do |s|
  s.name        = "countries"
  s.version     = Countries::VERSION
  s.authors     = ["Brad Seefeld"]
  s.email       = ["bradely.seefeld@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A library to provide a list of all countries}
  s.description = %q{Provides a country select form helper and integrates with formtastic.}

  s.rubyforge_project = "countries"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
end
