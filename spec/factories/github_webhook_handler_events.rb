FactoryGirl.define do
  factory :github_webhook_handler_event, class: 'GithubWebhookHandler::Event' do
    type ""
    payload "MyText"
  end
end
