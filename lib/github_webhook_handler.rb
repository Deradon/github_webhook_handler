require "github_webhook_handler/engine"
require "github_webhook_handler/listeners"

module GithubWebhookHandler #:nodoc:
  def self.on(event_type, action = :any, &block)
    listeners.push(event_type, action, &block)
  end

  def self.handle(event)
    listeners.handle(event)
  end

  def self.listeners
    @listeners ||= Listeners.new
  end
end
