module Elasticsearch
  module API
    module XPack
      module Security
        module Actions

          # TODO: Description
          #
          # @option arguments [String] :realms Comma-separated list of realms to clear (*Required*)
          # @option arguments [String] :usernames Comma-separated list of usernames to clear from the cache
          #
          # @see Clears the internal user caches for specified realms
          #
          def clear_cached_realms(arguments={})
            raise ArgumentError, "Required argument 'realms' missing" unless arguments[:realms]

            valid_params = [ :usernames ]

            arguments = arguments.clone
            realms = arguments.delete(:realms)

            method = HTTP_POST
            path   = Utils.__pathify "_xpack/security/realm/", Utils.__listify(realms), "_clear_cache"
            params = Utils.__validate_and_extract_params arguments, valid_params
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
