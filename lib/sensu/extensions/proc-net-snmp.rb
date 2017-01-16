require 'sensu/extension'
require 'set'

module Sensu
  module Extension
    class ProcNetSNMP < Check
      def name
        'proc_net_snmp'
      end

      def description
        'collects metrics in /proc/net/snmp, using the graphite plain-text format'
      end

      def definition
        {
          type: 'metric',
          name: name,
          interval: options[:interval],
          standalone: true,
          handler: options[:handler]
        }
      end

      def post_init
        @metrics = []
      end

      def run
        @metrics = []
        proc_net_snmp_metrics do
          yield flush_metrics, 0
        end
      end

      private

      def options
        return @options if @options
        @options = {
          interval: 10,
          handler: 'graphite',
          add_client_prefix: true,
          path_prefix: 'proc.net.snmp',
          prefix_at_start: true
        }
        if settings && settings[:proc_net_snmp].is_a?(Hash)
          @options.merge!(settings[:proc_net_snmp])
        end
        @options
      end

      def flush_metrics
        metrics = @metrics.join("\n") + "\n"
        @metrics = []
        metrics
      end

      def add_metric(*args)
        value = args.pop
        path = []
        path << options[:path_prefix] if options[:prefix_at_start]
        path << settings[:client][:name] if options[:add_client_prefix]
        path << options[:path_prefix] unless options[:prefix_at_start]
        path = (path + args).join('.')
        @metrics << [path, value, Time.now.to_i].join(' ')
      end

      def read_file(file_path, chunk_size = nil)
        content = ''
        File.open(file_path, 'r') do |file|
          read_chunk = proc do
            content << file.read(chunk_size)
            # #YELLOW
            unless file.eof? # rubocop:disable UnlessElse
              EM.next_tick(read_chunk)
            else
              yield content
            end
          end
          read_chunk.call
        end
      end

      def proc_net_snmp_metrics
        read_file('/proc/net/snmp') do |file|
          protos = Set.new
          metrics = []
          file.each_line do |line|
            proto, data = line.scan(/^([^:]+):\s+(.+)$/).first
            fields = data.nil? ? [] : data.split(/\s+/)
            if protos.member?(proto)
              begin
                values = fields.map {|s| Integer(s) }
              rescue ArgumentError => e
                next
              end
            else
              protos << proto
              metrics = fields
              values = []
            end
            unless values.empty?
              metrics.zip(values) do |metric, value|
                add_metric(proto.downcase, metric.downcase, value)
              end
            end
          end
          yield
        end
      end
    end
  end
end
