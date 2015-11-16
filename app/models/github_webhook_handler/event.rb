# == Links
#
# * https://developer.github.com/v3/activity/events/types/
module GithubWebhookHandler
  # TODO: Remove strings and replace with classes
  module Event
    TYPES = {
      issues: "GithubWebhookHandler::Event::Issue"
    }

    def self.class_for(type)
      (TYPES[type.to_sym] || "GithubWebhookHandler::Event::Unknown").constantize
    end
  end
end
