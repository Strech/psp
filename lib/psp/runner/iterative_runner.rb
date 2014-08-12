# coding: utf-8
require 'active_support/core_ext/object/try'

module Psp
  class Runner
    class IterativeRunner < AbstractRunner
      def run(context)
        succeed = @collection.collect do |element|
          say_running(element)

          result = !!system("#{context.env} bundle exec rspec #{element} #{stderr_to_stdout}")
          result ? say_succeed_finish(element) : say_failed_finish(element)

          result
        end

        succeed.all?
      end

      private

      def say_running(element)
        puts "Run #{green extract_name(element)}"
      end

      def say_succeed_finish(element)
        puts "Finished #{blue extract_name(element)}"
      end

      def say_failed_finish(element)
        puts "Finished #{red extract_name(element)} with errors"
      end

      def extract_name(element)
        element.match(/(?<name>[\w\-]+)\/spec$/)
          .try(:[], :name) || File.basename(element, '.rb')
      end
    end # PluginsRunner
  end # Runner
end # Psp
