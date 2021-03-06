require 'rails_helper'
require 'json'

module GithubWebhookHandler
  RSpec.describe Event::Status, type: :model do
    subject { described_class.new(payload: payload) }

    let(:payload) { JSON.parse(File.read(json_path)) }
    let(:json_path) { "spec/fixtures/github_events/status.json" }

    describe ".create" do
      it "creates a record" do
        expect {
          described_class.create(payload: payload)
        }.to change { described_class.count }.by(1)
      end
    end

    it { is_expected.to be_valid }

    its(:payload) { is_expected.to eq(payload) }
    its(:action) { is_expected.to eq(:not_specified) }

    its(:sha) { is_expected.to eq("9049f1265b7d61be4a8904a9a27120d2064dab3b") }
    its(:state) { is_expected.to eq("success") }
    its(:description) { is_expected.to eq(nil) }
    its(:target_url) { is_expected.to eq(nil) }
    its(:branches) { is_expected.to be_an(Array) }

    context "without action" do
      before { payload.merge!("action" => nil ) }
      it { is_expected.to be_valid }
    end

    describe ".webhook_event_name" do
      subject { described_class.webhook_event_name }
      it { is_expected.to eq("status") }
    end
  end
end
