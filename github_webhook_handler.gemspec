$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "github_webhook_handler/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "github_webhook_handler"
  s.version     = GithubWebhookHandler::VERSION
  s.authors     = ["Patrick Helm"]
  s.email       = ["me@patrick-helm.de"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of GithubWebhookHandler."
  s.description = "TODO: Description of GithubWebhookHandler."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
