# = PullRequestReviewCommentEvent
#
# Triggered when a comment is created on a portion of the unified diff of a
# pull request.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#pullrequestreviewcommentevent
module GithubWebhookHandler
  module Event
    class PullRequestReviewComment < Base
      webhook_event_name :pull_request_review_comment

      # The action that was performed on the comment.
      # Currently, can only be "created".
      actions(:created)

      # The pull request the comment belongs to.
      payload :pull_request

      # The comment itself.
      payload :comment
    end
  end
end
