require_dependency "github_webhook_handler/application_controller"
require 'github_signature'

module GithubWebhookHandler
  class EventsController < ApplicationController
    before_action :ensure_github_event
    before_action :ensure_valid_github_signature

    # POST /events.json
    #
    # TODO: Only respond to :json
    def create
      @event = Event.class_for(http_x_github_event).new({
        payload: event_params,
        http_x_github_event: http_x_github_event
      })

      respond_to do |format|
        if @event.save

          # TODO: spec
          ProcessEventJob.perform_later(@event)

          format.json { render json: @event, status: :created }
        else
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end

  private

    def event_params
      request.request_parameters
    end

    def ensure_github_event
      render_bad_request("Event is missing") unless http_x_github_event.present?
    end

    def ensure_valid_github_signature
      render_bad_request("Invalid signature") unless github_signature.valid?
    end

    def http_x_github_event
      request.headers["HTTP_X_GITHUB_EVENT"]
    end

    def render_bad_request(message)
      render text: message, status: :bad_request
    end

    def github_signature
      @github_signature ||= GithubSignature.from_request(request)
    end
  end
end
