# = PullRequestEvent
#
# Triggered when a pull request is assigned, unassigned, labeled, unlabeled,
# opened, closed, reopened, or synchronized.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#pullrequestevent
module GithubWebhookHandler
  module Event
    class PullRequest < Base
      webhook_event_name :pull_request

      ACTIONS = %w(
        assigned
        unassigned
        labeled
        unlabeled
        opened
        closed
        reopened
        synchronize
      )

      # The action that was performed.
      #
      # Can be one of "assigned", "unassigned", "labeled", "unlabeled",
      # "opened", "closed", or "reopened", or "synchronize".
      #
      # If the action is "closed" and the merged key is false,
      # the pull request was closed with unmerged commits.
      #
      # If the action is "closed" and the merged key is true,
      # the pull request was merged.
      actions(*ACTIONS)

      # The pull request number.
      payload :number

      # The pull request itself.
      payload :pull_request
    end
  end
end
