module GithubWebhookHandler
  module Event
    # = ReleaseEvent
    #
    # Triggered when a release is published.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#releaseevent
    class Release < Base
      webhook_event_name :release

      ##
      # :method: action
      #
      # The action that was performed.
      # Currently, can only be "published".
      actions(:published)

      ##
      # :method: release
      #
      # The release itself.
      payload :release
    end
  end
end
