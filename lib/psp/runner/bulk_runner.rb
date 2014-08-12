# coding: utf-8

module Psp
  class Runner
    class BulkRunner < AbstractRunner
      def run(context)
        say_running

        succeed = !!system("#{context.env} bundle exec rspec #{@collection * ' '} #{stderr_to_stdout}")
        succeed ? say_succeed_finish : say_failed_finish

        succeed
      end

      private

      def say_running
        puts "Run #{green extract_name}"
      end

      def say_succeed_finish
        puts "Finished #{blue extract_name}"
      end

      def say_failed_finish
        puts "Finished #{red extract_name} with errors"
      end

      def extract_name
        "files (#{@collection.count})"
      end
    end # ProjectRunner
  end # Runner
end # Psp
