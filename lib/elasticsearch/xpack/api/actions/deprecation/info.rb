module Elasticsearch
  module XPack
    module API
      module Deprecation
        module Actions

          # Return deprecation info
          #
          # @option arguments [String] :index Index pattern
          #
          # @see http://www.elastic.co/guide/en/migration/current/appendix-api-deprecation-info.html
          #
          def info(arguments={})
            method = Elasticsearch::API::HTTP_GET
            path   = Elasticsearch::API::Utils.__pathify arguments[:index], '_xpack/migration/deprecations'
            params = {}
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
