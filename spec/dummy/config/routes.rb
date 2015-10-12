Rails.application.routes.draw do

  mount GithubWebhookHandler::Engine => "/github_webhook_handler"
end
