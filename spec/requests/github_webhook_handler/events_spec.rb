require 'rails_helper'
require 'support/github_webhook_handler/request_helper'

module GithubWebhookHandler
  RSpec.describe "Events", type: :request do
    include RequestHelper

    setup_for_github_webhook_handler

    context "with valid headers" do
      it { is_expected.to have_http_status(:created) }
    end

    context "without HTTP_X_GITHUB_EVENT header" do
      let(:header) { valid_header.merge({ "HTTP_X_GITHUB_EVENT" => nil }) }

      it { is_expected.to have_http_status(:bad_request) }
      its(:body) { is_expected.to eq "Event is missing" }
    end

    context "with invalid HTTP_X_HUB_SIGNATURE header" do
      let(:header) { valid_header.merge({ "HTTP_X_HUB_SIGNATURE" => "invalid" }) }

      it { is_expected.to have_http_status(:bad_request) }
      its(:body) { is_expected.to eq "Invalid signature" }
    end
  end
end
