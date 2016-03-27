$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "github_webhook_handler/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "github_webhook_handler"
  s.version     = GithubWebhookHandler::VERSION
  s.authors     = ["Patrick Helm"]
  s.email       = ["me@patrick-helm.de"]
  s.homepage    = "http://gitlab.patrick-helm.de/patrick-helm/github_webhook_handler"
  s.summary     = "Handle GitHub webhooks."
  s.description = "github_webhook_handler is a Rails engine that handle GitHub webhooks."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
