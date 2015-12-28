# = ReleaseEvent
#
# Triggered when a release is published.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#releaseevent
module GithubWebhookHandler
  module Event
    class Release < Base
      webhook_event_name :release

      # The action that was performed.
      # Currently, can only be "published".
      actions(:published)

      # The release itself.
      payload :release
    end
  end
end
