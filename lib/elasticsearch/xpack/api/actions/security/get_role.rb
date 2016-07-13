module Elasticsearch
  module API
    module XPack
      module Security
        module Actions

          # Retrieve one or more roles from the native realm
          #
          # @option arguments [String] :name Role name
          #
          # @see https://www.elastic.co/guide/en/x-pack/current/security-api-roles.html#security-api-get-role
          #
          def get_role(arguments={})
            method = HTTP_GET
            path   = Utils.__pathify "_xpack/security/role", Utils.__listify(arguments[:name])
            params = {}
            body   = nil

            if Array(arguments[:ignore]).include?(404)
              Utils.__rescue_from_not_found { perform_request(method, path, params, body).body }
            else
              perform_request(method, path, params, body).body
            end
          end
        end
      end
    end
  end
end
