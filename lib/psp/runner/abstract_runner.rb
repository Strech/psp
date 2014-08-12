# coding: utf-8
module Psp
  class Runner
    class AbstractRunner
      include Output
      include Ascii

      def initialize(collection)
        @collection = Array.wrap(collection)
      end

      def run(context)
        raise NotImplementedError
      end

      private

      def stderr_to_stdout
        "2>&1#{' 1>/dev/null' unless Output.verbose? || Output.debug?}"
      end
    end # class AbstractRunner
  end # class Runner
end # module Psp
