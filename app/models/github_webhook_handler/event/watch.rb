module GithubWebhookHandler
  module Event
    # = WatchEvent
    #
    # The WatchEvent is related to starring a repository, not watching.
    # See this API blog post for an explanation.
    #
    # The event’s actor is the user who starred a repository, and the event’s
    # repository is the repository that was starred.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#watchevent
    class Watch < Base
      webhook_event_name :watch

      ##
      # :method: action
      #
      # The action that was performed.
      # Currently, can only be started.
      actions(:started)
    end
  end
end
