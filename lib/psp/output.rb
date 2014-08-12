# coding: utf-8

module Psp
  module Output
    class << self
      def setup(options)
        @verbose = options.fetch(:verbose, false)
        @debug = options.fetch(:debug, false)
      end

      def verbose?
        !!@verbose
      end

      def debug?
        !!@debug
      end
    end

    module_function

    def verbose
      yield if Output.verbose? || Output.debug?
    end

    def debug
      yield if Output.debug?
    end
  end # module Output
end # module Psp
