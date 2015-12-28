module GithubWebhookHandler
  module Event
    # = GollumEvent
    #
    # Triggered when a Wiki page is created or updated.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#gollumevent
    class Gollum < Base
      webhook_event_name :gollum

      ##
      # :method: pages
      #
      # The pages that were updated.
      payload :pages
    end
  end
end
