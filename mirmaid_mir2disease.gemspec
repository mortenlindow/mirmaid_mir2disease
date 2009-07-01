# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mirmaid_mir2disease}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Anders Jacobsen"]
  s.date = %q{2009-07-01}
  s.email = %q{andersmbj@gmail.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/andersjacobsen/mirmaid_mir2disease}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{miR2Disease (http://www.mir2disease.org) plugin for MirMaid}
  s.test_files = [
    "test/test_helper.rb",
     "test/mir2disease_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
