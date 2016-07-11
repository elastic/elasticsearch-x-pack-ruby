module Elasticsearch
  module API
    module XPack
      module Monitoring
        module Actions; end

        class MonitoringClient
          include Common::Client, Common::Client::Base, Monitoring::Actions
        end

        def monitoring
          @monitoring ||= MonitoringClient.new(self)
        end

      end
    end
  end
end
