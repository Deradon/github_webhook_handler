# == Links
#
# * https://developer.github.com/v3/activity/events/types/
module GithubWebhookHandler
  module Event
    def self.class_for(type)
      class_name = "GithubWebhookHandler::Event::#{type.camelize}"

      if const_defined?(class_name)
        class_name.constantize
      else
        GithubWebhookHandler::Event::Unknown
      end
    end
  end
end
