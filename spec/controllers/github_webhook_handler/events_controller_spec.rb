require 'rails_helper'

module GithubWebhookHandler
  RSpec.describe EventsController, type: :controller do
    routes { GithubWebhookHandler::Engine.routes }

    let(:valid_attributes) {
      { payload: { action: "labeled" } }
    }

    let(:invalid_attributes) {
      { type: "Integer" }
    }

    let(:valid_session) { {} }

    describe "POST #create" do
      context "with valid params" do
        it "creates a new Event" do
          expect {
            post :create, { event: valid_attributes, format: :json }, valid_session
          }.to change(Event, :count).by(1)
        end

        it "assigns a newly created event as @event" do
          post :create, { event: valid_attributes, format: :json }, valid_session
          expect(assigns(:event)).to be_a(Event)
          expect(assigns(:event)).to be_persisted
        end

        # it "redirects to the created event" do
        #   post :create, { event: valid_attributes, format: :json }, valid_session
        #   expect(response).to redirect_to(Event.last)
        # end
      end

      # context "with invalid params" do
      #   it "assigns a newly created but unsaved event as @event" do
      #     post :create, { event: invalid_attributes, format: :json }, valid_session
      #     expect(assigns(:event)).to be_a_new(Event)
      #   end
      #
      #   it "re-renders the 'new' template" do
      #     post :create, { event: invalid_attributes, format: :json }, valid_session
      #     expect(response).to render_template("new")
      #   end
      # end
    end
  end
end
