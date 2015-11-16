# = IssuesEvent
#
# Triggered when an issue is assigned, unassigned, labeled, unlabeled,
# opened, closed, or reopened.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#issuesevent
module GithubWebhookHandler
  module Event
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

      # The action that was performed.
      # Can be one of "assigned", "unassigned", "labeled", "unlabeled",
      # "opened", "closed", or "reopened".
      actions(*ACTIONS)

      # The issue itself.
      payload :issue, required: true

      # The optional user who was assigned or unassigned from the issue.
      payload :assignee

      # The optional label that was added or removed from the issue.
      payload :label
    end
  end
end
