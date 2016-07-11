module Elasticsearch
  module API
    module XPack
      module License
        module Actions

          # Install a license
          #
          # @option arguments [Hash] :body Licenses to be installed
          # @option arguments [Boolean] :acknowledge Whether the user has acknowledged acknowledge messages
          #                                          (default: false)
          #
          # @see https://www.elastic.co/guide/en/shield/current/license-management.html
          #
          def post(arguments={})
            valid_params = [ :acknowledge ]
            method = HTTP_PUT
            path   = "_xpack/license"
            params = Utils.__validate_and_extract_params arguments, valid_params
            body   = arguments[:body]

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
