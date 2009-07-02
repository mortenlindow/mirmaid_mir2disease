# Uninstall hook code here
ENV['RAILS_ENV'] ||= 'production'
require(File.join(".", 'config', 'boot')) #called from application root dir

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'tasks/rails'

Rake.application['mirmaid:plugin:mir2disease:uninstall'].invoke
