# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nbp/version"

Gem::Specification.new do |s|
  s.name        = "nbp"
  s.version     = Nbp::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tomasz Mazur"]
  s.email       = ["defkode@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/nbp"
  s.summary     = %q{Fetches currencies from nbp.pl}
  s.description = %q{Fetches currencies from nbp.pl}

  s.rubyforge_project = "nbp"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('httparty', '>= 0.16.0')
  s.add_development_dependency('pry')
end
