# coding: utf-8
require 'optparse'

module Psp
  class Cli
    class Options
      attr_reader :runner_tasks
      attr_reader :runner_options

      def self.parse!(payload)
        new.tap { |o| o.parse!(payload) }
      end

      def initialize
        @runner_tasks = Hash.new
        @runner_options = Hash.new
      end

      def parse!(payload)
        options_parser.parse!(payload)
      rescue OptionParser::ParseError
        puts 'Error: wrong usage. See help.'
        puts option_parser.help
        exit
      end

      private

      def options_parser
        OptionParser.new do |parser|
          @runner_tasks = Hash.new
          @runner_options = Hash.new

          parser.banner = "Parallel specs\nUsage: psp [options]"
          parser.version = VERSION

          parser.on('-p', '--project', 'Run all project specs') do
            @runner_tasks[:project] = PathResolver::DEFAULT_PATH_MASK
          end

          parser.on('-g', '--plugins', 'Run all plugins specs') do
            @runner_tasks[:plugins] = PathResolver::DEFAULT_PATH_MASK
          end

          parser.on('-l', '--plugin=<plugin1,...>', Array, 'Run specified plugins specs') do |plugins|
            @runner_tasks[:plugins] = plugins
          end

          parser.on('-j', '--jobs=<concurrency>', Integer, 'Set runner concurrency') do |concurrency|
            @runner_options[:concurrency] = concurrency
          end

          parser.on('-t', '--rate=<number>', Integer, 'Set allocation rate') do |rate|
            @runner_options[:rate] = rate
          end

          parser.on('--dry-run', 'Check out the allocations') do
            @runner_options[:dry_run] = true
          end

          parser.on('-v', '--verbose', 'Turn on verbosity') do
            @runner_options[:verbose] = true
          end

          parser.on('-d', '--debug', 'Turn on debug verbosity') do
            @runner_options[:debug] = true
          end

          parser.on_tail('--version', 'Display the version') do
            puts parser.version
            exit
          end

          parser.on_tail('-h', '--help', 'You are looking at it') do
            puts parser.help
            exit
          end
        end
      end
    end # class Options
  end # class Cli
end # module Psp

