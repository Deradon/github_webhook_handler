require 'rails_helper'

RSpec.describe GithubWebhookHandler do
  describe ".on" do
    let(:context) { Proc.new { 42 } }

    context "when given only a event type" do
      after { subject.on(:issues, &context) }

      specify do
        expect(subject.listeners).to receive(:push).with(:issues, :any)
      end
    end

    context "when given a event type and an action" do
      after { subject.on(:issues, :labeled, &context) }

      specify do
        expect(subject.listeners).to receive(:push).with(:issues, :labeled)
      end
    end
  end

  describe ".handle" do
    after { subject.handle(event) }
    let(:event) { instance_double(GithubWebhookHandler::Event::Base) }

    specify do
      expect(subject.listeners).to receive(:handle).with(event)
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


  describe ".config" do
    subject { described_class.config }

    it { is_expected.to be_kind_of(GithubWebhookHandler::Config) }
    it "memoizes the Configuration" do
      expect(subject).to eq(described_class.config)
    end
  end
end
