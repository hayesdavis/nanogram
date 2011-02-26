module Nanogram
  class Tokenizer

    attr_accessor :sanitizer, :filters, :splitter

    def initialize(sanitizer=nil,*filters)
      self.splitter = /\s+/
      self.sanitizer = sanitizer || Sanitizer.new
      self.filters = filters
    end

    def tokenize(text)
      filter(split(sanitize(text)))
    end
    
    def ngrams(size,text)
      tokens = tokenize(text)
      grams = []
      sizes = case size
        when Range then size.to_a
        when Array then size
        else [size]
      end
      sizes.each do |ngram_size|
        tokens[0..(0 - ngram_size)].each_with_index do |word, word_i|
          grams << tokens[word_i..(word_i + ngram_size - 1)].join(" ")
        end
      end
      grams
    end
    
    protected
      def split(text)
        text.split(splitter)  
      end
      
      def sanitize(text)
        if sanitizer.nil?
          text
        else
          sanitizer.sanitize(text)          
        end
      end
      
      def filter(tokens)
        if filters.nil? || filters.empty?
          tokens
        else
          tokens.reject do |token|
            filters.any?{|f| f.match?(token) }
          end
        end
      end

  end
end