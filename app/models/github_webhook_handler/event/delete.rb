# = DeleteEvent
#
# Represents a deleted branch or tag.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#deleteevent
module GithubWebhookHandler
  module Event
    class Delete < Base
      webhook_event_name :delete

      # The object that was deleted. Can be "branch" or "tag".
      payload :ref_type

      # The full git ref.
      payload :ref
    end
  end
end
