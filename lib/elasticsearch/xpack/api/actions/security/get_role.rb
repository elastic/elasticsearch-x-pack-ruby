module Elasticsearch
  module API
    module XPack
      module Security
        module Actions

          # TODO: Description
          #
          # @option arguments [String] :name Role name
          #
          # @see Retrieve one or more roles from the native shield realm
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
