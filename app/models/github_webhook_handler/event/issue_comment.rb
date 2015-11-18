# = IssueCommentEvent
#
# Triggered when an issue comment is created on an issue or pull request.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#issuecommentevent
module GithubWebhookHandler
  module Event
    class IssueComment < Base
      webhook_event_name :issue_comment

      # The action that was performed on the comment.
      # Currently, can only be "created".
      actions(:created)

      # The issue the comment belongs to.
      payload :issue

      # The comment itself.
      payload :comment
    end
  end
end
