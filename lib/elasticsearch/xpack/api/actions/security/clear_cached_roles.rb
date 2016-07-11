module Elasticsearch
  module API
    module XPack
      module Security
        module Actions

          # TODO: Description
          #
          # @option arguments [String] :name Role name (*Required*)
          #
          # @see Clears the internal caches for specified roles
          #
          def clear_cached_roles(arguments={})
            raise ArgumentError, "Required argument 'name' missing" unless arguments[:name]

            method = HTTP_PUT
            path   = "_xpack/security/role/#{arguments[:name]}/_clear_cache"
            params = {}
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
