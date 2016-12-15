# == Links
#
# * https://developer.github.com/v3/activity/events/types/
module GithubWebhookHandler
  module Event
    def self.class_for(type)
      class_name = "GithubWebhookHandler::Event::#{type.camelize}"

      class_name.constantize
    rescue
      GithubWebhookHandler::Event::Unknown
    end
  end
end
