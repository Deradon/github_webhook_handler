module GithubWebhookHandler
  module Event
    # = ForkEvent
    #
    # Triggered when a user forks a repository.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#forkevent
    class Fork < Base
      webhook_event_name :fork

      ##
      # :method: forkee
      #
      # The created repository.
      payload :forkee
    end
  end
end
