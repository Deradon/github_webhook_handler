# = DeploymentEvent
#
# Represents a deployment.
#
# Events of this type are not visible in timelines,
# they are only used to trigger hooks.
#
# == Links
#
# * https://developer.github.com/v3/activity/events/types/#deploymentevent
module GithubWebhookHandler
  module Event
    class Deployment < Base
      webhook_event_name :deployment

      # The deployment.
      payload :deployment

      # The repository for this deployment.
      payload :repository
    end
  end
end
