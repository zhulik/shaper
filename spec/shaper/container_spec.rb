# frozen_string_literal: true

RSpec.describe Shaper::Container do
  let(:reducer) do
    Class.new do
      include Shaper::Reducer

      def initial_state
        {}
      end
    end
  end
  let(:container) { described_class.new(reducer.new) }

  describe "#state" do
    subject { container.state }

    it "returns current state" do
      expect(subject).to eq({})
    end
  end
end
