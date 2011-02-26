$LOAD_PATH.unshift './lib'
require 'nanogram/version'

Gem::Specification.new do |s|
  s.name              = "nanogram"
  s.version           = Nanogram::VERSION
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "Nanogram is a simple string tokenizer and ngram generator"
  s.homepage          = "http://github.com/hayesdavis/nanogram"
  s.email             = "hayes@appozite.com"
  s.authors           = [ "Hayes Davis" ]
  
  s.files            += Dir.glob("lib/**/*")

  #s.extra_rdoc_files  = [ "LICENSE", "README.md" ]

  s.description = <<-description
    Nanogram is a small simple library for sanitizing, filtering, tokenizing 
    and ngramming strings.
  description
end
