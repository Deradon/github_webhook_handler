module GithubWebhookHandler
  module Event
    # = CommitCommentEvent
    #
    # Triggered when a commit comment is created.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#commitcommentevent
    class CommitComment < Base
      webhook_event_name :commit_comment

      ##
      # :method: action
      #
      # The action that was performed.
      actions(:created)

      ##
      # :method: comment
      #
      # The comment itself.
      payload :comment, required: true
    end
  end
end
