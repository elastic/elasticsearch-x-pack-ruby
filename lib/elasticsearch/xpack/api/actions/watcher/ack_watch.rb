module Elasticsearch
  module API
    module XPack
      module Watcher
        module Actions

          # TODO: Description
          #
          # @option arguments [String] :watch_id Watch ID (*Required*)
          # @option arguments [List] :action_id A comma-separated list of the action ids to be acked
          # @option arguments [Duration] :master_timeout Specify timeout for watch write operation
          #
          # @see http://www.elastic.co/guide/en/watcher/current/appendix-api-ack-watch.html
          #
          def ack_watch(arguments={})
            raise ArgumentError, "Required argument 'watch_id' missing" unless arguments[:watch_id]

            valid_params = [
              :master_timeout,
              :action_id ]

            arguments = arguments.clone
            watch_id  = arguments.delete(:watch_id)

            method = HTTP_PUT
            path   = "_xpack/watcher/watch/#{watch_id}/_ack"
            params = Utils.__validate_and_extract_params arguments, valid_params
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
