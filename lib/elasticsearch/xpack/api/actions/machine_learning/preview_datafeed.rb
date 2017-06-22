module Elasticsearch
  module XPack
    module API
      module MachineLearning
        module Actions

          # TODO: Description
          #
          # @option arguments [String] :datafeed_id The ID of the datafeed to preview (*Required*)
          #
          # @see http://www.elastic.co/guide/en/x-pack/current/ml-preview-datafeed.html
          #
          def preview_datafeed(arguments={})
            raise ArgumentError, "Required argument 'datafeed_id' missing" unless arguments[:datafeed_id]
            method = Elasticsearch::API::HTTP_GET
            path   = "_xpack/ml/datafeeds/#{arguments[:datafeed_id]}/_preview"
            params = {}
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
