module GithubWebhookHandler
  class Config
    attr_accessor :github_secret

    def github_secret
      @github_secret ||= "<REPLACE ME>"
    end
  end
end
