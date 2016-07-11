module Elasticsearch
  module API
    module XPack
      module Watcher
        module Actions

          # TODO: Description
          #
          # @option arguments [String] :metric Controls what additional stat metrics should be include in the response (options: _all, queued_watches, pending_watches)
          # @option arguments [String] :metric Controls what additional stat metrics should be include in the response (options: _all, queued_watches, pending_watches)
          #
          # @see http://www.elastic.co/guide/en/watcher/current/appendix-api-stats.html
          #
          def stats(arguments={})
            valid_params = [
              :metric ]
            method = HTTP_GET
            path   = "_xpack/watcher/stats"
            params = Utils.__validate_and_extract_params arguments, valid_params
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
