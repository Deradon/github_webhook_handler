# = MemberEvent
#
# Triggered when a user is added as a collaborator to a repository.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#memberevent
module GithubWebhookHandler
  module Event
    class Member < Base
      webhook_event_name :member

      # The action that was performed.
      # Currently, can only be "added".
      actions(:added)

      # The user that was added.
      payload :member
    end
  end
end
