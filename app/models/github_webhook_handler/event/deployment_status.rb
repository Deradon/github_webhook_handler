module GithubWebhookHandler
  module Event
    # = DeploymentStatusEvent
    #
    # Represents a deployment status.
    #
    # Events of this type are not visible in timelines,
    # they are only used to trigger hooks.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#deploymentstatusevent
    class DeploymentStatus < Base
      webhook_event_name :deployment_status

      ##
      # :method: deployment_status
      #
      # The deployment status.
      payload :deployment_status

      ##
      # :method: deployment
      #
      # The deployment that this status is associated with.
      payload :deployment

      ##
      # :method: repository
      #
      # The repository for this deployment.
      payload :repository
    end
  end
end
