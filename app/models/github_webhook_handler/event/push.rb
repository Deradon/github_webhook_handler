# = PushEvent
#
# Triggered when a repository branch is pushed to.
# In addition to branch pushes, webhook push events are also triggered when
# repository tags are pushed.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#pushevent
module GithubWebhookHandler
  module Event
    class Push < Base
      webhook_event_name :push

      # The full Git ref that was pushed.
      # Example: "refs/heads/master".
      payload :ref

      # The SHA of the most recent commit on ref after the push.
      payload :head

      # The SHA of the most recent commit on ref before the push.
      payload :before

      # The number of commits in the push.
      payload :size

      # The number of distinct commits in the push.
      payload :distinct_size

      # An array of commit objects describing the pushed commits.
      # (The array includes a maximum of 20 commits. If necessary, you can use
      # the Commits API to fetch additional commits. This limit is applied to
      # timeline events only and isn't applied to webhook deliveries.)
      payload :commits
    end
  end
end
