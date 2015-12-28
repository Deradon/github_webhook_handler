module GithubWebhookHandler
  module Event
    # = DeleteEvent
    #
    # Represents a deleted branch or tag.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#deleteevent
    class Delete < Base
      webhook_event_name :delete

      ##
      # :method: ref_type
      #
      # The object that was deleted. Can be "branch" or "tag".
      payload :ref_type

      ##
      # :method: ref
      #
      # The full git ref.
      payload :ref
    end
  end
end
