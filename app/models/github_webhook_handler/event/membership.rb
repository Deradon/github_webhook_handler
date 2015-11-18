# = MembershipEvent
#
# Triggered when a user is added or removed from a team.
#
# Events of this type are not visible in timelines,
# they are only used to trigger organization webhooks.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#membershipevent
module GithubWebhookHandler
  module Event
    class Membership < Base
      webhook_event_name :membership

      # The action that was performed.
      # Can be "added" or "removed".
      actions(:added, :removed)

      # The scope of the membership.
      # Currently, can only be "team".
      payload :scope

      # The user that was added or removed.
      payload :member

      # The team for the membership.
      payload :team
    end
  end
end
