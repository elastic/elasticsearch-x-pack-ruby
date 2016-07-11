module Elasticsearch
  module API
    module XPack
      module Watcher
        module Actions

          # TODO: Description
          #
          #
          # @see http://www.elastic.co/guide/en/watcher/current/appendix-api-service.html
          #
          def stop(arguments={})
            method = HTTP_PUT
            path   = "_xpack/watcher/_stop"
            params = {}
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
