$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_restful/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_restful"
  s.version     = RailsRestful::VERSION
  s.authors     = ["Daniel C. Biscalchin"]
  s.email       = ["dancabis@gmail.com"]
  s.homepage    = "https://github.com/dbiscalchin/rails_restful"
  s.summary     = "Tools to easily build RESTful APIs with Ruby on Rails."
  s.description = "Tools to easily build RESTful APIs with Ruby on Rails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.2"

  s.add_development_dependency "sqlite3"
end
