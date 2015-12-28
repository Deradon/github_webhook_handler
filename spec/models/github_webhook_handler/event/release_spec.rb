require 'rails_helper'
require 'json'

module GithubWebhookHandler
  RSpec.describe Event::Release, type: :model do
    subject { described_class.new(payload: payload) }

    let(:payload) { JSON.parse(File.read(json_path)) }
    let(:json_path) { "spec/fixtures/github_events/release.json" }

    describe ".create" do
      it "creates a record" do
        expect {
          described_class.create(payload: payload)
        }.to change { described_class.count }.by(1)
      end
    end

    it { is_expected.to be_valid }

    its(:payload) { is_expected.to eq(payload) }
    its(:action) { is_expected.to eq("published") }

    its(:release) { is_expected.to be_a(Hash) }

    context "without action" do
      before { payload.merge!("action" => nil ) }
      it { is_expected.not_to be_valid }
    end

    context "with action: 'published'" do
      before { payload.merge!("action" => "published" ) }
      it { is_expected.to be_valid }
    end

    context "with action: 'invalid'" do
      before { payload.merge!("action" => "invalid" ) }
      it { is_expected.not_to be_valid }
    end

    describe ".webhook_event_name" do
      subject { described_class.webhook_event_name }
      it { is_expected.to eq("release") }
    end
  end
end
