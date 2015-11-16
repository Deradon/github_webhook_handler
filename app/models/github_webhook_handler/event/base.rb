module GithubWebhookHandler
  module Event
    class Base < ActiveRecord::Base
      self.abstract_class = true
      self.table_name = "github_webhook_handler_events"

      serialize :payload

      def action
        payload["action"]
      end

      private

      def self.webhook_event_name(name = nil)
        if name
          @webhook_event_name = name
        else
          @webhook_event_name.to_s
        end
      end

      def self.actions(*actions)
        validates :action,
          presence: true,
          inclusion: { in: actions.map(&:to_s) }
      end

      def self.payload(type, options = {})
        required = options.fetch(:required) { false }

        validates(type, presence: true) if required

        define_method(type) do
          payload[type.to_s]
        end
      end
    end
  end
end
