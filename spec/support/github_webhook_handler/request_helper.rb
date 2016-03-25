module GithubWebhookHandler
  module RequestHelper
    def self.included(base)
      base.send :extend, ClassMethods
    end

    def call_endpoint
      post(endpoint, params.to_json, header)
    end

    private

    def signature_for(payload, secret:)
      hexdigest = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), secret, payload.to_json)

      "sha1=#{hexdigest}"
    end

    module ClassMethods
      def setup_for_github_webhook_handler
        subject { response }
        before { call_endpoint }

        around do |example|
          secret = GithubWebhookHandler.config.github_secret
          GithubWebhookHandler.config.github_secret = "geheim"
          example.run
          GithubWebhookHandler.config.github_secret = secret
        end

        let(:endpoint) { "/github_webhook_handler/events" }
        let(:params) { {} }
        let(:header) { valid_header }
        let(:valid_header) {
          {
            "HTTP_X_GITHUB_EVENT" => "issues",
            "HTTP_X_HUB_SIGNATURE" => signature_for(params, secret: "geheim"),
          }.merge(json_header)
        }
        let(:json_header) {
          {
            "ACCEPT" => "application/json",
            "CONTENT_TYPE" => "application/json"
          }
        }
      end
    end
  end
end
