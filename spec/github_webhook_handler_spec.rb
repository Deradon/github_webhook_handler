require 'rails_helper'

RSpec.describe GithubWebhookHandler do
  describe ".on" do
    let(:context) { Proc.new { 42 } }
    after { subject.on(:issues, &context) }

    specify do
      expect(subject.listeners).to receive(:push).with(:issues)
      # TODO: .with(:issues, context)
    end
  end

  describe ".listeners" do
    subject { described_class.listeners }

    it { is_expected.to be_a(GithubWebhookHandler::Listeners) }

    context "when calling .listeners twice" do
      let(:another_listeners) { described_class.listeners }
      it { is_expected.to be(another_listeners) }
    end
  end
end
