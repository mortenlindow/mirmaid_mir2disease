# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mirmaid_mir2disease}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Anders Jacobsen"]
  s.date = %q{2009-07-01}
  s.description = %q{TODO}
  s.email = %q{andersmbj@gmail.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "MIT-LICENSE",
     "README",
     "Rakefile",
     "VERSION",
     "app/controllers/m2d_disease_links_controller.rb",
     "app/controllers/m2d_diseases_controller.rb",
     "app/models/m2d_disease.rb",
     "app/models/m2d_disease_link.rb",
     "app/views/m2d_disease_links/_list_for_mature.html.erb",
     "app/views/m2d_disease_links/_m2d_disease_link.html.erb",
     "app/views/m2d_disease_links/index.html.erb",
     "app/views/m2d_disease_links/show.html.erb",
     "app/views/m2d_diseases/_m2d_disease.html.erb",
     "app/views/m2d_diseases/index.html.erb",
     "app/views/m2d_diseases/show.html.erb",
     "config/routes.rb",
     "data/mir2dis.txt",
     "init.rb",
     "install.rb",
     "lib/mir2disease.rb",
     "mirmaid_mir2disease.gemspec",
     "mirmaid_models.rb",
     "rdoc/classes/M2dDisease.html",
     "rdoc/classes/M2dDiseaseLink.html",
     "rdoc/classes/M2dDiseaseLinksController.html",
     "rdoc/classes/M2dDiseasesController.html",
     "rdoc/created.rid",
     "rdoc/css/main.css",
     "rdoc/css/panel.css",
     "rdoc/css/reset.css",
     "rdoc/files/README.html",
     "rdoc/files/app/controllers/m2d_disease_links_controller_rb.html",
     "rdoc/files/app/controllers/m2d_diseases_controller_rb.html",
     "rdoc/files/app/models/m2d_disease_link_rb.html",
     "rdoc/files/app/models/m2d_disease_rb.html",
     "rdoc/files/lib/mir2disease_rb.html",
     "rdoc/i/arrows.png",
     "rdoc/i/results_bg.png",
     "rdoc/i/tree_bg.png",
     "rdoc/index.html",
     "rdoc/js/jquery-1.3.2.min.js",
     "rdoc/js/main.js",
     "rdoc/js/searchdoc.js",
     "rdoc/panel/index.html",
     "rdoc/panel/search_index.js",
     "rdoc/panel/tree.js",
     "tasks/mir2disease_tasks.rake",
     "test/mir2disease_test.rb",
     "test/test_helper.rb",
     "uninstall.rb"
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
