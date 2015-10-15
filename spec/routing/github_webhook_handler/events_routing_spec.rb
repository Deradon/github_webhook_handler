require "rails_helper"

module GithubWebhookHandler
  RSpec.describe EventsController, type: :routing do
    routes { GithubWebhookHandler::Engine.routes }

    describe "routing" do
      it "routes to #create" do
        expect(post: "/events").to route_to(controller: "github_webhook_handler/events", action: "create")
      end
    end
  end
end
