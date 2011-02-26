module Nanogram
  module Filters
    class StopWords
  
      class << self
        def load(file)
          stops = self.new
          File.open(file,'r') do |io|
            stops.read(io)
          end
          stops
        end
      end
  
      def initialize(*words)
        @stops = Set.new
        add_all(words.flatten)
      end
      
      def <<(word)
        @stops << word
      end
      
      def add_all(words)
        words.each do |word|
          self << word
        end
      end
  
      def match?(ngram)
        @stops.include?(ngram)
      end
  
      def read(io)
        io.readlines.each do |word|
          word.strip!
          if not word.empty? and not word =~ /^#/
            self << word
          end
        end
      end
  
    end
  end
end
