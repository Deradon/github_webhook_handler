# = ForkEvent
#
# Triggered when a user forks a repository.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#forkevent
module GithubWebhookHandler
  module Event
    class Fork < Base
      webhook_event_name :fork

      # The created repository.
      payload :forkee
    end
  end
end
