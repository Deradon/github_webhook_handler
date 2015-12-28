require 'rails_helper'
require 'json'

module GithubWebhookHandler
  RSpec.describe Event::PullRequest, type: :model do
    subject { described_class.new(payload: payload) }

    let(:payload) { JSON.parse(File.read(json_path)) }
    let(:json_path) { "spec/fixtures/github_events/pull_request.json" }

    describe ".create" do
      it "creates a record" do
        expect {
          described_class.create(payload: payload)
        }.to change { described_class.count }.by(1)
      end
    end

    it { is_expected.to be_valid }

    its(:payload) { is_expected.to eq(payload) }
    its(:action) { is_expected.to eq("opened") }

    its(:number) { is_expected.to eq(1) }
    its(:pull_request) { is_expected.to be_a(Hash) }

    context "without action" do
      before { payload.merge!("action" => nil ) }
      it { is_expected.not_to be_valid }
    end

    context "with action: 'assigned'" do
      before { payload.merge!("action" => "assigned" ) }
      it { is_expected.to be_valid }
    end

    context "with action: 'unassigned'" do
      before { payload.merge!("action" => "unassigned" ) }
      it { is_expected.to be_valid }
    end

    context "with action: 'labeled'" do
      before { payload.merge!("action" => "labeled" ) }
      it { is_expected.to be_valid }
    end

    context "with action: 'unlabeled'" do
      before { payload.merge!("action" => "unlabeled" ) }
      it { is_expected.to be_valid }
    end

    context "with action: 'opened'" do
      before { payload.merge!("action" => "opened" ) }
      it { is_expected.to be_valid }
    end

    context "with action: 'closed'" do
      before { payload.merge!("action" => "closed" ) }
      it { is_expected.to be_valid }
    end

    context "with action: 'reopened'" do
      before { payload.merge!("action" => "reopened" ) }
      it { is_expected.to be_valid }
    end

    context "with action: 'synchronize'" do
      before { payload.merge!("action" => "synchronize" ) }
      it { is_expected.to be_valid }
    end

    context "with action: 'invalid'" do
      before { payload.merge!("action" => "invalid" ) }
      it { is_expected.not_to be_valid }
    end

    describe ".webhook_event_name" do
      subject { described_class.webhook_event_name }
      it { is_expected.to eq("pull_request") }
    end
  end
end
