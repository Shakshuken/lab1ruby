class Item
    attr_accessor :quote, :author, :tags, :about_author, :born_date
  
    def initialize(quote, author, tags = [], about_author = nil, born_date = nil)
      @quote = quote
      @author = author
      @tags = tags
      @about_author = about_author
      @born_date = born_date
    end
  
    def info
      if block_given?
        yield self
      else
        to_s
      end
    end
  
    def to_s
      "#{@quote} - #{@author}"
    end
  
    def to_h
      { quote: @quote, author: @author, tags: @tags, about_author: @about_author, born_date: @born_date }
    end
  end