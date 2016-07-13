module Elasticsearch
  module API
    module XPack
      module Security
        module Actions

          # Retrieve details about the currently authenticated user
          #
          # @see https://www.elastic.co/guide/en/x-pack/current/security-api-authenticate.html
          #
          def authenticate(arguments={})
            valid_params = []
            method = HTTP_GET
            path   = "_xpack/security/_authenticate"
            params = {}
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
