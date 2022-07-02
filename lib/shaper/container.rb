# frozen_string_literal: true

module Shaper
  class Container
    def initialize(reducer)
      @state = reducer.initial_state
    end

    def state = Marshal.load(Marshal.dump(@state))
  end
end
