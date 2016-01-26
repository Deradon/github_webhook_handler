module GithubWebhookHandler
  # TODO: Can we improve the naming?
  class Listeners
    def push(event_type, &context)
      listeners[event_type.to_sym] << context
    end

    def handle(event)
      event_type = event.class.webhook_event_name

      listeners_for(event_type.to_sym).each do |listener|
        listener.call(event)
      end
    end

    private

    def listeners
      @listeners ||= Hash.new { |h, event_type| h[event_type] = Array.new  }
    end

    def listeners_for(event_type)
      listeners[event_type]
    end
  end
end
