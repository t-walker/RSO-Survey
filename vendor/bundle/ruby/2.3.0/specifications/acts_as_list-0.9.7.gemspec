# -*- encoding: utf-8 -*-
# stub: acts_as_list 0.9.7 ruby lib

Gem::Specification.new do |s|
  s.name = "acts_as_list"
  s.version = "0.9.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["David Heinemeier Hansson", "Swanand Pagnis", "Quinn Chaffee"]
  s.date = "2017-07-06"
  s.description = "This \"acts_as\" extension provides the capabilities for sorting and reordering a number of objects in a list. The class that has this specified needs to have a \"position\" column defined as an integer on the mapped database table."
  s.email = ["swanand.pagnis@gmail.com"]
  s.homepage = "http://github.com/swanandp/acts_as_list"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubyforge_project = "acts_as_list"
  s.rubygems_version = "2.5.1"
  s.summary = "A gem adding sorting, reordering capabilities to an active_record model, allowing it to act as a list"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
  end
end
