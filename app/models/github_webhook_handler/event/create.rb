# = CreateEvent
#
# Represents a created repository, branch, or tag.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#createevent
module GithubWebhookHandler
  module Event
    class Create < Base
      webhook_event_name :create

      # The object that was created. Can be one of "repository", "branch",
      # or "tag"
      payload :ref_type

      # The git ref (or null if only a repository was created).
      payload :ref

      # The name of the repository’s default branch (usually master).
      payload :master_branch

      # The repository's current description.
      payload :description
    end
  end
end
