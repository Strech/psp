# coding: utf-8
require 'optparse'

module Psp
  class Cli
    def initialize(argv)
      @argv = argv
    end

    def run
      options = Options.parse!(@argv)
      tasks = PathResolver.new(options.runner_tasks).expand
      succeed = Runner.new(tasks, options.runner_options).run
      exit_code = boolean_to_exit_code(succeed)

      puts "Total exit code: #{exit_code}"
      exit(exit_code)
    end

    private

    def boolean_to_exit_code(boolean)
      boolean ? 0 : 1
    end
  end  # class Cli
end # module Psp
