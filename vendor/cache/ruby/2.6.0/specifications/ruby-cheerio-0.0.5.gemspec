# -*- encoding: utf-8 -*-
# stub: ruby-cheerio 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "ruby-cheerio".freeze
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dineshprabu S".freeze]
  s.date = "2016-08-09"
  s.description = "Ruby Cheerio is a jQuery style HTML parser, which take selectors as input. This is a Ruby version NodeJS package named 'Cheerio', which is extensively used by crawlers. Please visit the home page for usage details.".freeze
  s.email = "dineshsprabu@gmail.com".freeze
  s.homepage = "https://github.com/dineshsprabu/ruby-cheerio".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "JQuery styled HTML parser".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
  end
end
