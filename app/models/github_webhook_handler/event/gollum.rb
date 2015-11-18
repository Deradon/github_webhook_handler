# = GollumEvent
#
# Triggered when a Wiki page is created or updated.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#gollumevent
module GithubWebhookHandler
  module Event
    class Gollum < Base
      webhook_event_name :gollum

      # The pages that were updated.
      payload :pages
    end
  end
end
