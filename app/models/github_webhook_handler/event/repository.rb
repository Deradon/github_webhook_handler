module GithubWebhookHandler
  module Event
    # = RepositoryEvent
    #
    # Triggered when a repository is created.
    #
    # Events of this type are not visible in timelines,
    # they are only used to trigger organization webhooks.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#repositoryevent
    class Repository < Base
      webhook_event_name :repository

      ##
      # :method: action
      #
      # The action that was performed.
      # Currently, can only be "created".
      actions(:created)

      ##
      # :method: repository
      #
      # The repository itself.
      payload :repository
    end
  end
end
