module Elasticsearch
  module XPack
    module API
      module MachineLearning
        module Actions

          # TODO: Description
          #
          # @option arguments [String] :datafeed_id The ID of the datafeeds to fetch
          #
          # @see http://www.elastic.co/guide/en/x-pack/current/ml-get-datafeed.html
          #
          def get_datafeeds(arguments={})
            method = Elasticsearch::API::HTTP_GET
            path   = "_xpack/ml/datafeeds/#{arguments[:datafeed_id]}"
            params = {}
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
