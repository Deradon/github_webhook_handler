require_dependency "github_webhook_handler/application_controller"

module GithubWebhookHandler
  class EventsController < ApplicationController
    # POST /events.json
    def create
      @event = Event.new(event_params)

      respond_to do |format|
        if @event.save
          format.json { render json: @event, status: :created }
        else
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end

  private

    def event_params
      # request.request_parameters
      params.require(:event).permit(:payload)
    end
  end
end
