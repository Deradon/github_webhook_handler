require 'rails_helper'

RSpec.describe GithubWebhookHandler::Config do
  its(:github_secret) { is_expected.to eq("<REPLACE ME>") }

  describe "#github_secret=" do
    before { subject.github_secret = "42" }

    its(:github_secret) { is_expected.to eq("42") }
  end
end
