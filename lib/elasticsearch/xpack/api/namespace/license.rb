module Elasticsearch
  module API
    module XPack
      module License
        module Actions; end

        class LicenseClient
          include Common::Client, Common::Client::Base, License::Actions
        end

        def license
          @license ||= LicenseClient.new(self)
        end

      end
    end
  end
end
