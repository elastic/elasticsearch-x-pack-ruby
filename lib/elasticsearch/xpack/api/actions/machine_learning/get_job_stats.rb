module Elasticsearch
  module XPack
    module API
      module MachineLearning
        module Actions

          # TODO: Description
          #
          # @option arguments [String] :job_id The ID of the jobs stats to fetch
          #
          # @see http://www.elastic.co/guide/en/x-pack/current/ml-get-job-stats.html
          #
          def get_job_stats(arguments={})
            method = Elasticsearch::API::HTTP_GET
            path   = "_xpack/ml/anomaly_detectors/#{arguments[:job_id]}/_stats"
            params = {}
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end
