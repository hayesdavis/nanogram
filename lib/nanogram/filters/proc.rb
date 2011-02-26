module Nanogram
  module Filters
    class Proc
      
      def initialize(&block)
        @filter_proc = block
      end
      
      def match?(text)
        @filter_proc.call(text)
      end
      
    end
  end
end