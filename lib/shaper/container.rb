# frozen_string_literal: true

module Shaper
  class Container
    class UnknownEventError < Shaper::Error; end

    def initialize(reducer)
      @reducer = reducer
      @state = reducer.initial_state
    end

    def state = Marshal.load(Marshal.dump(@state))

    def dispatch(event_name, payload)
      raise UnknownEventError, "Handler for '#{event_name}' is not found" unless @reducer.respond_to?(event_name)

      @state = @reducer.public_send(event_name, state, payload)
      # TODO: notify subscribers
      nil
    end
  end
end
