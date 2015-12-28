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
module GithubWebhookHandler
  module Event
    class Repository < Base
      webhook_event_name :repository

      # The action that was performed.
      # Currently, can only be "created".
      actions(:created)

      # The repository itself.
      payload :repository
    end
  end
end
