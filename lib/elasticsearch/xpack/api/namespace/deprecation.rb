module Elasticsearch
  module XPack
    module API
      module Deprecation
        module Actions; end

        class DeprecationClient
          include Elasticsearch::API::Common::Client, Elasticsearch::API::Common::Client::Base, Deprecation::Actions
        end

        def deprecation
          @deprecation ||= DeprecationClient.new(self)
        end

      end
    end
  end
end
