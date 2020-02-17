# -*- encoding: utf-8 -*-
# stub: simple_mercator_location 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "simple_mercator_location".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Roman Lehnert".freeze]
  s.date = "2013-06-29"
  s.description = "Converts WSG84 Coordinates via Mercator-projection to meters and tiles".freeze
  s.email = "roman.lehnert@googlemail.com".freeze
  s.homepage = "https://github.com/romanlehnert/simple_mercator_location".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A tiny lib for the mercator projecton".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.5"])
    else
      s.add_dependency(%q<rspec>.freeze, ["~> 2.5"])
    end
  else
    s.add_dependency(%q<rspec>.freeze, ["~> 2.5"])
  end
end
