require 'rails_helper'

RSpec.describe GithubWebhookHandler::Listeners do
  subject(:listeners) { described_class.new }

  let(:issue_event) {
    GithubWebhookHandler::Event::Issue.new(payload: { "action" => "labeled" })
  }
  let(:pull_request_event) { GithubWebhookHandler::Event::PullRequest.new }
  let(:push_event) { GithubWebhookHandler::Event::Push.new }

  let(:test_context) { test_context_class.new }
  let(:test_context_class) do
    Class.new do
      def foo; end
      def bar; end
      def baz; end
      def fourty_two; end
      def any_callback; end
    end
  end

  describe "#push" do
    context "when given invalid event_type" do
      let(:event_type) { :invalid }

      it "raises an ArgumentError" do
        pending
        fail
      end
    end
  end

  describe "#handle(event)" do
    after { listeners.handle(event) }

    before do
      listeners.push(:any, :any) do |event|
        test_context.any_callback
      end

      listeners.push(:issues, :any) do |event|
        test_context.foo
      end

      listeners.push(:issues, :any) do |event|
        test_context.bar
      end

      listeners.push(:issues, :labeled) do |event|
        test_context.fourty_two
      end

      listeners.push(:pull_request, :any) do |event|
        test_context.baz
      end
    end

    context "without a registered handler" do
      let(:event) { push_event }

      specify do
        expect(test_context).to receive(:any_callback)
        expect(test_context).not_to receive(:foo)
        expect(test_context).not_to receive(:bar)
        expect(test_context).not_to receive(:baz)
        expect(test_context).not_to receive(:fourty_two)
      end
    end

    context "with one registered handler" do
      let(:event) { pull_request_event }

      specify do
        expect(test_context).to receive(:any_callback)
        expect(test_context).not_to receive(:foo)
        expect(test_context).not_to receive(:bar)
        expect(test_context).to receive(:baz)
        expect(test_context).not_to receive(:fourty_two)
      end
    end

    context "with two registered handlers" do
      let(:event) { issue_event }

      specify do
        expect(test_context).to receive(:any_callback)
        expect(test_context).to receive(:foo)
        expect(test_context).to receive(:bar)
        expect(test_context).not_to receive(:baz)
        expect(test_context).to receive(:fourty_two)
      end
    end
  end
end
