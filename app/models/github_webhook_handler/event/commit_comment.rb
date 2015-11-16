# = CommitCommentEvent
#
# Triggered when a commit comment is created.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#commitcommentevent
module GithubWebhookHandler
  module Event
    class CommitComment < Base
      webhook_event_name :commit_comment

      # The action that was performed.
      actions(:created)

      # The comment itself.
      payload :comment, required: true
    end
  end
end
