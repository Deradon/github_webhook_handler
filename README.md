_WIP_

# GitHubWebhookHandler

`github_webhook_handler` is a Rails engine that handle GitHub webhooks.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'github_webhook_handler'
```

### Routes

Add this entry to your routes file:

```ruby
# config/routes.rb

mount GithubWebhookHandler::Engine => "/github_webhook_handler"
```

### Initializer

```ruby
require "github_webhook_handler"

Dir["app/github_webhook_handlers/*"].each { |file| load(file) }

# Configure your github secret for callbacks
GithubWebhookHandler.configure do |config|
  config.github_secret = Rails.application.secrets.github_webhook_secret
end
```

## Usage

### Example

```ruby
# app/github_webhook_secret/pull_request.rb

# Handles a PullRequestEvent where action is 'labeled'.
#
# E.g.: Whenever a GitHub PR is labeled with 'codereview', we want to post a
#       message to a chat application called "Flowdock". Same for a PR that
#       is labeled with 'ready-to-merge'.
GithubWebhookHandler.on(:pull_request, :labeled) do |event|
  case event.label[:name]
  when "codereview"
    Flowdock::AnnounceCodeReview.run(event)
  when "ready-to-merge"
    Flowdock::AnnounceReadyToMerge.run(event)
  else
    # NOOP
  end
end
```

## Configure GitHub

* **TODO**
