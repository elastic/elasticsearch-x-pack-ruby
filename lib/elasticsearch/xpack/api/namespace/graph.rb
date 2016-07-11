module Elasticsearch
  module API
    module XPack
      module Graph
        module Actions; end

        class GraphClient
          include Common::Client, Common::Client::Base, Graph::Actions
        end

        def graph
          @graph ||= GraphClient.new(self)
        end

      end
    end
  end
end
