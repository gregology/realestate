# -*- encoding: utf-8 -*-
# stub: scenic 1.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "scenic".freeze
  s.version = "1.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Derek Prior".freeze, "Caleb Thompson".freeze]
  s.date = "2019-02-11"
  s.description = "    Adds methods to ActiveRecord::Migration to create and manage database views\n    in Rails\n".freeze
  s.email = ["derekprior@gmail.com".freeze, "caleb@calebthompson.io".freeze]
  s.homepage = "https://github.com/scenic-views/scenic".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Support for database views in Rails migrations".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<appraisal>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.5"])
      s.add_development_dependency(%q<database_cleaner>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 3.3"])
      s.add_development_dependency(%q<pg>.freeze, ["~> 0.19"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<ammeter>.freeze, [">= 1.1.3"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0"])
      s.add_development_dependency(%q<redcarpet>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 4.0.0"])
      s.add_runtime_dependency(%q<railties>.freeze, [">= 4.0.0"])
    else
      s.add_dependency(%q<appraisal>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.5"])
      s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 3.3"])
      s.add_dependency(%q<pg>.freeze, ["~> 0.19"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<ammeter>.freeze, [">= 1.1.3"])
      s.add_dependency(%q<yard>.freeze, [">= 0"])
      s.add_dependency(%q<redcarpet>.freeze, [">= 0"])
      s.add_dependency(%q<activerecord>.freeze, [">= 4.0.0"])
      s.add_dependency(%q<railties>.freeze, [">= 4.0.0"])
    end
  else
    s.add_dependency(%q<appraisal>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.5"])
    s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.3"])
    s.add_dependency(%q<pg>.freeze, ["~> 0.19"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<ammeter>.freeze, [">= 1.1.3"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
    s.add_dependency(%q<redcarpet>.freeze, [">= 0"])
    s.add_dependency(%q<activerecord>.freeze, [">= 4.0.0"])
    s.add_dependency(%q<railties>.freeze, [">= 4.0.0"])
  end
end
