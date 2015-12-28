module GithubWebhookHandler
  module Event
    # = MemberEvent
    #
    # Triggered when a user is added as a collaborator to a repository.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#memberevent
    class Member < Base
      webhook_event_name :member

      ##
      # :method: action
      #
      # The action that was performed.
      # Currently, can only be "added".
      actions(:added)

      ##
      # :method: member
      #
      # The user that was added.
      payload :member
    end
  end
end
