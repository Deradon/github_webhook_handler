module GithubWebhookHandler
  module Event
    # = PullRequestReviewCommentEvent
    #
    # Triggered when a comment is created on a portion of the unified diff of a
    # pull request.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#pullrequestreviewcommentevent
    class PullRequestReviewComment < Base
      webhook_event_name :pull_request_review_comment

      ##
      # :method: action
      #
      # The action that was performed on the comment.
      # Currently, can only be "created".
      actions(:created)

      ##
      # :method: pull_request
      #
      # The pull request the comment belongs to.
      payload :pull_request

      ##
      # :method: comment
      #
      # The comment itself.
      payload :comment
    end
  end
end
