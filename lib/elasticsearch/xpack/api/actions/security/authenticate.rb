module Elasticsearch
  module API
    module XPack
      module Security
        module Actions

          # TODO: Description
          #
          #
          # @see Retrieve details about the currently authenticated user
          #
          def authenticate(arguments={})
            valid_params = [
               ]
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
