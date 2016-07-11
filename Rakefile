require 'bundler/gem_tasks'

require 'rake/testtask'

task :default do
  exec "rake --tasks"
end

Rake::TestTask.new('test:unit') do |test|
  test.libs << 'test'
  test.test_files = FileList['test/unit/**/*_test.rb']
  # test.verbose = true
  # test.warning = true
end

namespace :test do
  desc "Run integration tests"
  task :integration do
    require 'ansi'

    suites = %w[
      x-plugins/elasticsearch/x-pack/graph/src/test/resources/rest-api-spec/test
      x-plugins/elasticsearch/x-pack/monitoring/src/test/resources/rest-api-spec/test/monitoring
      x-plugins/elasticsearch/x-pack/security/src/test/resources/rest-api-spec/test
      x-plugins/elasticsearch/x-pack/watcher/src/test/resources/rest-api-spec/test/xpack/watcher
      x-plugins/elasticsearch/x-pack/license-plugin/src/test/resources/rest-api-spec/test
    ]

    # TEMPORARY
    disabled_suites = %w[
    ]

    suites = (suites + disabled_suites).select! { |d| d =~ Regexp.new(ENV['SUITE'].gsub(/,/, '|')) } if ENV['SUITE']

    executed_suites = []

    at_exit do
      errors = executed_suites.any? { |d| d.values.first == 1 }
      color  = errors ? :red : :green

      if errors
        puts "----- ".ansi(color) + "ERROR".ansi(color).ansi(:bold) + ('-'*(80-12)).ansi(color)
      else
        puts "----- ".ansi(color) + "SUCCESS".ansi(color).ansi(:bold) + ('-'*(80-13)).ansi(color)
      end

      executed_suites.each do |d|
        name = d.keys.first.gsub(%r{x-plugins/elasticsearch/x-pack/([^/]+)/.*}, '\1')
        status = d.values.first == 0 ? 'OK'.ansi(:green) : 'KO'.ansi(:red)
        puts "#{status} #{name.ansi(:bold)}"
      end

      puts ('-'*80).ansi(color)

      exit( errors ? 1 : 0 )
    end

    suites.each do |suite|
      begin
        sh <<-COMMAND
          TEST_REST_API_SPEC=../#{suite} bundle exec ruby -I lib:test test/integration/yaml_test_runner.rb
        COMMAND
        executed_suites << { suite => 0 }
      rescue RuntimeError
        executed_suites << { suite => 1 }
      end

      puts '', '-'*80, ''
    end
  end
end

namespace :elasticsearch do
  desc "Start Elasticsearch node for tests"
  task :start do
    require 'elasticsearch/extensions/test/cluster'
    Elasticsearch::Extensions::Test::Cluster.start(port: ENV.fetch('TEST_CLUSTER_PORT', 9260), nodes: 1, path_logs: '/tmp')
  end

  desc "Stop Elasticsearch node for tests"
  task :stop do
    require 'elasticsearch/extensions/test/cluster'
    Elasticsearch::Extensions::Test::Cluster.stop(port: ENV.fetch('TEST_CLUSTER_PORT', 9260), nodes: 1)
  end

  task :status do
    require 'elasticsearch/extensions/test/cluster'
    begin
      Elasticsearch::Extensions::Test::Cluster.__print_cluster_info(ENV.fetch('TEST_CLUSTER_PORT', 9260))
    rescue Errno::ECONNREFUSED
      puts "\e[31m[!] Test cluster not running\e[0m"; exit(1)
    end
  end
end
