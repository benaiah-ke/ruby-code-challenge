require 'pry'
class Article

    attr_reader :title, :author, :magazine
    
    @@all = []

    def initialize(title, author, magazine)
        @author = author
        @magazine = magazine
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end

end
