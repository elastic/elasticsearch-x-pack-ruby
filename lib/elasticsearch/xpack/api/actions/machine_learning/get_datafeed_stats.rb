module Elasticsearch
  module XPack
    module API
      module MachineLearning
        module Actions

          # TODO: Description
          #
          # @option arguments [String] :datafeed_id The ID of the datafeeds stats to fetch
          #
          # @see http://www.elastic.co/guide/en/x-pack/current/ml-get-datafeed-stats.html
          #
          def get_datafeed_stats(arguments={})
            method = Elasticsearch::API::HTTP_GET
            path   = Elasticsearch::API::Utils.__pathify "_xpack/ml/datafeeds", arguments[:datafeed_id], "/_stats"
            params = {}
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
