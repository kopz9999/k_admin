$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "k_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "k_admin"
  s.version     = KAdmin::VERSION
  s.authors     = ["Kyoto Kopz"]
  s.email       = ["kopz9999@gmail.com"]
  s.homepage    = "http://bitbucket.org/kkyoto/"
  s.summary     = "Provides assets for KAdmin theme"
  s.description = "Provides assets for KAdmin theme as an engine, it includes a framework with js, css and images"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", '~> 4.1', '>= 4.1.0'
  s.add_dependency 'sass-rails', '~> 5.0', '>= 5.0.0'
  s.add_dependency 'coffee-rails', '~> 4.0', '>= 4.0.0'

  s.add_development_dependency "sqlite3", "1.3.10"
end
