module GithubWebhookHandler
  module Event
    # = IssuesEvent
    #
    # Triggered when an issue is assigned, unassigned, labeled, unlabeled,
    # opened, closed, or reopened.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#issuesevent
    class Issue < Base
      webhook_event_name :issues

      ACTIONS = %w(
        assigned
        unassigned
        labeled
        unlabeled
        opened
        closed
        reopened
      )

      ##
      # :method: action
      #
      # The action that was performed.
      # Can be one of "assigned", "unassigned", "labeled", "unlabeled",
      # "opened", "closed", or "reopened".
      actions(*ACTIONS)

      ##
      # :method: issue
      #
      # The issue itself.
      payload :issue, required: true

      ##
      # :method: assigned
      #
      # The optional user who was assigned or unassigned from the issue.
      payload :assignee

      ##
      # :method: label
      #
      # The optional label that was added or removed from the issue.
      payload :label
    end
  end
end
