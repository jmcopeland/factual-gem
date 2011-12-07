# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "factual/version"

Gem::Specification.new do |s|
  s.name        = "factual"
  s.version     = Factual::VERSION
  s.authors     = ["Justin Copeland"]
  s.email       = ["justin@gootnau.com"]
  s.homepage    = "http://github.com/jmcopeland/factual"
  s.summary     = %q{Factual v3 API wrapper}
  s.description = %q{Factual v3 API wrapper}

  s.rubyforge_project = "factual"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "httparty"
  s.add_runtime_dependency "hashie"
  s.add_runtime_dependency "rash"
end
