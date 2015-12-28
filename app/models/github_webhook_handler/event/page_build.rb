module GithubWebhookHandler
  module Event
    # = PageBuildEvent
    #
    # Represents an attempted build of a GitHub Pages site,
    # whether successful or not.
    #
    # Triggered on push to a GitHub Pages enabled branch
    # (gh-pages for project pages, master for user and organization pages).
    #
    # Events of this type are not visible in timelines,
    # they are only used to trigger hooks.
    #
    # == Links
    #
    # * https://developer.github.com/v3/activity/events/types/#pagebuildevent
    class PageBuild < Base
      webhook_event_name :page_build

      ##
      # :method: build
      #
      # The page build itself.
      payload :build
    end
  end
end
