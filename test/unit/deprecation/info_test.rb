require 'test_helper'

module Elasticsearch
  module Test
    class XPackDeprecationInfoTest < Minitest::Test

      context "XPack Deprecation: Info" do
        subject { FakeClient.new }

        should "perform correct request" do
          subject.expects(:perform_request).with do |method, url, params, body|
            assert_equal 'GET', method
            assert_equal "_xpack/migration/deprecations", url
            assert_equal Hash.new, params
            assert_nil   body
            true
          end.returns(FakeResponse.new)

          subject.xpack.deprecation.info
        end

      end

    end
  end
end
