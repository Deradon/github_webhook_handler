module GithubWebhookHandler
  module Event
    # = CreateEvent
    #
    # Represents a created repository, branch, or tag.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#createevent
    class Create < Base
      webhook_event_name :create

      ##
      # :method: ref_type
      #
      # The object that was created. Can be one of "repository", "branch",
      # or "tag"
      payload :ref_type

      ##
      # :method: ref
      #
      # The git ref (or null if only a repository was created).
      payload :ref

      ##
      # :method: master_branch
      #
      # The name of the repository’s default branch (usually master).
      payload :master_branch

      ##
      # :method: description
      #
      # The repository's current description.
      payload :description
    end
  end
end
