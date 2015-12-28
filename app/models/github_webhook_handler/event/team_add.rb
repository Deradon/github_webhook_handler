# = TeamAddEvent
#
# Triggered when a repository is added to a team.
#
# Events of this type are not visible in timelines.
# These events are only used to trigger hooks.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#teamaddevent
module GithubWebhookHandler
  module Event
    class TeamAdd < Base
      webhook_event_name :team_add

      # The team that was modified.
      # NOTE: older events may not include this in the payload.
      payload :team

      # The repository that was added to this team.
      payload :repository
    end
  end
end
