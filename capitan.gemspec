# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "capitan"

Gem::Specification.new do |s|
  s.name        = "capitan"
  s.version     = '1.0.0'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Eric Sipple"]
  s.email       = ["sipple@trustarts.org"]
  s.homepage    = "https://github.com/pgharts/capitan/"
  s.summary     = %q{Interface for culturaldistrict.org's read-only API}
  s.description = %q{Culturaldistrict.org provides access to all events through cAPI, and capitan can get that data for you.}

  s.add_dependency 'rest-client'

  ignores = if File.exist?('.gitignore')
              File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
            else
              []
            end
  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  # s.executables   = Dir['bin/*'] - ignores
  s.require_paths = ["lib"]
end
