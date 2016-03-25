require 'rails_helper'
require 'json'

module GithubWebhookHandler
  RSpec.describe Event::Create, type: :model do
    subject { described_class.new(payload: payload) }

    let(:payload) { JSON.parse(File.read(json_path)) }
    let(:json_path) { "spec/fixtures/github_events/create.json" }

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

    its(:ref_type) { is_expected.to eq("tag") }
    its(:ref) { is_expected.to eq("0.0.1") }
    its(:master_branch) { is_expected.to eq("master") }
    its(:description) { is_expected.to eq("") }

    describe ".webhook_event_name" do
      subject { described_class.webhook_event_name }
      it { is_expected.to eq("create") }
    end
  end
end
