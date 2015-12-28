module GithubWebhookHandler
  module Event
    # = StatusEvent
    #
    # Triggered when the status of a Git commit changes.
    #
    # Events of this type are not visible in timelines,
    # they are only used to trigger hooks.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#statusevent
    class Status < Base
      webhook_event_name :status

      ##
      # :method: sha
      #
      # The Commit SHA.
      payload :sha

      ##
      # :method: state
      #
      # The new state. Can be pending, success, failure, or error.
      payload :state

      ##
      # :method: description
      #
      # The optional human-readable description added to the status.
      payload :description

      ##
      # :method: target_url
      #
      # The optional link added to the status.
      payload :target_url

      ##
      # :method: branches
      #
      # An array of branch objects containing the status' SHA.
      # Each branch contains the given SHA, but the SHA may or may not be the
      # head of the branch. The array includes a maximum of 10 branches.
      payload :branches
    end
  end
end
