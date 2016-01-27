require 'rails_helper'

module GithubWebhookHandler
  RSpec.describe ProcessEventJob, type: :job do
    subject(:job) { described_class.new }

    describe "#perform" do
      after { job.perform(event) }
      let(:event) { instance_double(GithubWebhookHandler::Event::Base) }

      specify do
        expect(GithubWebhookHandler).to receive(:handle).with(event)
      end
    end
  end
end
