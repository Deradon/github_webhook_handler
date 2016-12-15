require 'rails_helper'

module GithubWebhookHandler
  RSpec.describe Event, type: :model do
    shared_examples "a event" do |type, klass|
      describe ".class_for(type)" do
        subject { described_class.class_for(type) }

        context "with type: '#{type}'" do
          let(:type) { type.to_s }
          it { is_expected.to eq klass }
        end
      end
    end

    it_behaves_like "a event", "issues", Event::Issues
    it_behaves_like "a event", "pull_request", Event::PullRequest
    it_behaves_like "a event", "foo", Event::Unknown
  end
end
