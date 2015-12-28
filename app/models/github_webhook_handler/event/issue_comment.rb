module GithubWebhookHandler
  module Event
    # = IssueCommentEvent
    #
    # Triggered when an issue comment is created on an issue or pull request.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#issuecommentevent
    class IssueComment < Base
      webhook_event_name :issue_comment

      ##
      # :method: action
      #
      # The action that was performed on the comment.
      # Currently, can only be "created".
      actions(:created)

      ##
      # :method: issue
      #
      # The issue the comment belongs to.
      payload :issue

      ##
      # :method: comment
      #
      # The comment itself.
      payload :comment
    end
  end
end
