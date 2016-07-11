module Elasticsearch
  module API
    module XPack
      module Security
        module Actions

          # TODO: Description
          #
          # @option arguments [String] :name Role name (*Required*)
          # @option arguments [Hash] :body The role to add (*Required*)
          # @option arguments [Boolean] :refresh Refresh the index after performing the operation
          #
          # @see Update or create a role for the native shield realm
          #
          def put_role(arguments={})
            raise ArgumentError, "Required argument 'name' missing" unless arguments[:name]
            raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

            valid_params = [ :refresh ]

            method = HTTP_PUT
            path   = "_xpack/security/role/#{arguments[:name]}"
            params = Utils.__validate_and_extract_params arguments, valid_params
            body   = arguments[:body]

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
