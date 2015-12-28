module GithubWebhookHandler
  module Event
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
    class TeamAdd < Base
      webhook_event_name :team_add

      ##
      # :method: team
      #
      # The team that was modified.
      # NOTE: older events may not include this in the payload.
      payload :team

      ##
      # :method: repository
      #
      # The repository that was added to this team.
      payload :repository
    end
  end
end
