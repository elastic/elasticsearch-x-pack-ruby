module Elasticsearch
  module API
    module XPack
      module Watcher
        module Actions; end

        class WatcherClient
          include Common::Client, Common::Client::Base, Watcher::Actions
        end

        def watcher
          @watcher ||= WatcherClient.new(self)
        end

      end
    end
  end
end
