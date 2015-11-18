# = PublicEvent
#
# Triggered when a private repository is open sourced.
# Without a doubt: the best GitHub event.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#publicevent
module GithubWebhookHandler
  module Event
    class Public < Base
      webhook_event_name :public
    end
  end
end
