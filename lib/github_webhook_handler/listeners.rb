module GithubWebhookHandler
  class Listeners
    def push(event_type, action, &context)
      listeners[event_type.to_sym][action.to_sym] << context
    end

    def handle(event)
      event_type = event.class.webhook_event_name

      listeners_for(event_type, event.action).each do |listener|
        listener.call(event)
      end
    end

    private

    def listeners
      @listeners ||= Hash.new do |event_lookup, event_type|
        event_lookup[event_type] = Hash.new do |action_lookup, action_type|
          action_lookup[action_type] = Array.new
        end
      end
    end

    def listeners_for(event_type, action_type)
      event_listeners = listeners[event_type.to_sym]

      event_listeners[:any] | event_listeners[action_type.to_sym]
    end
  end
end
