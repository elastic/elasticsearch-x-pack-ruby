module Elasticsearch
  module API
    module XPack
      module Watcher
        module Actions

          # TODO: Description
          #
          # @option arguments [String] :id Watch ID (*Required*)
          #
          # @see http://www.elastic.co/guide/en/watcher/current/appendix-api-get-watch.html
          #
          def get_watch(arguments={})
            raise ArgumentError, "Required argument 'id' missing" unless arguments[:id]

            method = HTTP_GET
            path   = "_xpack/watcher/watch/#{arguments[:id]}"
            params = {}
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
