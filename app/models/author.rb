require_relative 'article'

class Author
  attr_accessor :name

  attr_reader :name, :articles, :magazines

  def initialize(name)
    @name = name
  end

  def articles
    # Filter all artices,
    # return those matching the author
    Article.all.filter do |article|
      article.author == self
    end
  end

  def magazines
    # Check all articles
    # and get unique magazines
    articles.collect do |article|
      article.magazine.uniq
    end
  end

  def add_article(magazine, title)
    Article.new(magazine, title)
  end

  def topic_areas
    # Check all magazines
    # and get unique categories
    magazines.collect do |magazines|
      magazines.category.uniq
    end
  end


end
