module Elasticsearch
  module API
    module XPack
      module Security
        module Actions; end

        class SecurityClient
          include Common::Client, Common::Client::Base, Security::Actions
        end

        def security
          @security ||= SecurityClient.new(self)
        end

      end
    end
  end
end
