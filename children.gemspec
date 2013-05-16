# encoding: utf-8

$:.push File.expand_path('../lib', __FILE__)
require 'children/version'

Gem::Specification.new do |s|
  s.name        = 'children'
  s.version     = Children::VERSION.dup
  s.summary     = 'Building Daemon Family.'
  s.description = 'Starts one parent daemon and N child processes'
  s.author      = 'presskey'
  s.email       = 'hello.from.code@gmail.com'
  s.homepage    = 'http://github.com/presskey/npa'
  
  s.files       = ["lib/children.rb"]
  s.require_paths = ["lib"]
end