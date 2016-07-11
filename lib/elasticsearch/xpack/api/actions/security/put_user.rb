module Elasticsearch
  module API
    module XPack
      module Security
        module Actions

          # TODO: Description
          #
          # @option arguments [String] :username The username of the User (*Required*)
          # @option arguments [Hash] :body The user to add (*Required*)
          # @option arguments [Boolean] :refresh Refresh the index after performing the operation
          #
          # @see Update or create a user for the native shield realm
          #
          def put_user(arguments={})
            raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]

            valid_params = [ :refresh ]

            arguments = arguments.clone
            username = arguments.delete(:username)

            method = HTTP_PUT
            path   = Utils.__pathify "_xpack/security/user", username
            params = Utils.__validate_and_extract_params arguments, valid_params
            body   = arguments[:body]

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
