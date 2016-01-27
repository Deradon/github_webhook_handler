module GithubWebhookHandler
  class ProcessEventJob < ActiveJob::Base
    queue_as :default

    def perform(event)
      GithubWebhookHandler.handle(event)
    end
  end
end
