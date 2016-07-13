module Elasticsearch
  module API
    module XPack
      module Watcher
        module Actions

          # Return the current Watcher metrics
          #
          # @option arguments [String] :metric Additional metrics to be included in the response
          #                                   (options: _all, queued_watches, pending_watches)
          #
          # @see https://www.elastic.co/guide/en/x-pack/current/watcher-api-stats.html
          #
          def stats(arguments={})
            valid_params = [ :metric ]
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
