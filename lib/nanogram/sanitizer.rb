module Nanogram
  
  class Sanitizer
    
    attr_accessor :steps
    
    def initialize
      self.steps = []
    end
    
    def remove(regex)
      gsub(regex,"")
    end
    
    def gsub(regex,replace)
      add_step{|text| text.gsub!(regex,replace) }
    end
    
    def downcase
      add_step{|text| text.downcase! }
    end
    
    def upcase
      add_step{|text| text.upcase! }
    end

    def strip
      add_step{|text| text.strip! }
    end    
    
    def add_step(&block)
      steps << block
      self
    end
    
    def sanitize(text)
      new_text = text.dup
      steps.each do |step|
        step.call(new_text)
      end
      new_text
    end
    
  end
  
end