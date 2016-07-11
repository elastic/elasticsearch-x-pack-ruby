require "elasticsearch/api"
require "elasticsearch/xpack/version"

Dir[ File.expand_path('../xpack/api/actions/**/*.rb', __FILE__) ].each   { |f| require f }
Dir[ File.expand_path('../xpack/api/namespace/**/*.rb', __FILE__) ].each { |f| require f }

module Elasticsearch
  module API
    module XPack
      def self.included(base)
        Elasticsearch::API::XPack.constants.reject {|c| c == :Client }.each do |m|
          base.__send__ :include, Elasticsearch::API::XPack.const_get(m)
        end
      end

      class Client
        include Elasticsearch::API::Common::Client, Elasticsearch::API::Common::Client::Base
        include Elasticsearch::API::XPack
      end
    end
  end
end

module Elasticsearch
  module Transport
    class Client
      def xpack
        @xpack_client ||= Elasticsearch::API::XPack::Client.new(self)
      end
    end
  end
end if defined?(Elasticsearch::Transport::Client)
