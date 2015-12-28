require 'rails_helper'
require 'json'

module GithubWebhookHandler
  RSpec.describe Event::Push, type: :model do
    subject { described_class.new(payload: payload) }

    let(:payload) { JSON.parse(File.read(json_path)) }
    let(:json_path) { "spec/fixtures/github_events/push.json" }

    describe ".create" do
      it "creates a record" do
        expect {
          described_class.create!(payload: payload)
        }.to change { described_class.count }.by(1)
      end
    end

    it { is_expected.to be_valid }

    its(:payload) { is_expected.to eq(payload) }
    its(:action) { is_expected.to eq(nil) }

    its(:ref) { is_expected.to eq("refs/heads/changes") }
    its(:head) { is_expected.to eq(nil) }
    its(:before) { is_expected.to eq("9049f1265b7d61be4a8904a9a27120d2064dab3b") }
    its(:size) { is_expected.to eq(nil) }
    its(:distinct_size) { is_expected.to eq(nil) }
    its(:commits) { is_expected.to be_an(Array) }

    describe ".webhook_event_name" do
      subject { described_class.webhook_event_name }
      it { is_expected.to eq("push") }
    end
  end
end
