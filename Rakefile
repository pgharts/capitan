require 'rake'
require 'rake/testtask'
require 'trustygems'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the capitan plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end