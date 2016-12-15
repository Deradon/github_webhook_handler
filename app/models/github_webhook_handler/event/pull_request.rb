module GithubWebhookHandler
  module Event
    # = PullRequestEvent
    #
    # Triggered when a pull request is assigned, unassigned, labeled, unlabeled,
    # opened, closed, reopened, or synchronized.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#pullrequestevent
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

      ##
      # :method: action
      #
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

      ##
      # :method: number
      #
      # The pull request number.
      payload :number

      ##
      # :method: pull_request
      #
      # The pull request itself.
      payload :pull_request

      ##
      # :method: label
      #
      # The optional label that was added or removed from the issue.
      payload :label
    end
  end
end
