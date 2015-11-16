require 'rails_helper'
require 'json'

module GithubWebhookHandler
  RSpec.describe Event::Delete, type: :model do
    subject { described_class.new(payload: payload) }

    let(:payload) { JSON.parse(File.read(json_path)) }
    let(:json_path) { "spec/fixtures/github_events/delete.json" }

    describe ".create" do
      it "creates a record" do
        expect {
          described_class.create(payload: payload)
        }.to change { described_class.count }.by(1)
      end
    end

    it { is_expected.to be_valid }

    its(:payload) { is_expected.to eq(payload) }
    its(:action) { is_expected.to eq(nil) }

    its(:ref_type) { is_expected.to eq("tag") }
    its(:ref) { is_expected.to eq("simple-tag") }

    describe ".webhook_event_name" do
      subject { described_class.webhook_event_name }
      it { is_expected.to eq("delete") }
    end
  end
end
