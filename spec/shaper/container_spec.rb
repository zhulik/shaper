# frozen_string_literal: true

RSpec.describe Shaper::Container do
  let(:reducer) do
    Class.new do
      include Shaper::Reducer

      def initial_state
        0
      end

      def increase(state, payload)
        state + payload
      end

      def decrease(state, payload)
        state - payload
      end
    end
  end
  let(:container) { described_class.new(reducer.new) }

  describe "#state" do
    subject { container.state }

    it "returns current state" do
      expect(subject).to eq(0)
    end
  end

  describe "#dispatch" do
    subject { container.dispatch(event_name, payload) }

    let(:payload) { 1 }

    context "when event handler exists" do
      it "modifies state" do # rubocop:disable RSpec/MultipleExpectations
        container.dispatch(:increase, 1)
        expect(container.state).to eq(1)
        container.dispatch(:decrease, 1)
        expect(container.state).to eq(0)
      end
    end

    context "when event handler does not exist" do
      let(:event_name) { "unknown" }

      it "raises an error" do
        expect do
          subject
        end.to raise_error(described_class::UnknownEventError, "Handler for 'unknown' is not found")
      end
    end
  end
end
