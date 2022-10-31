require_relative 'article'

class Magazine
    attr_accessor :name, :category

    @@all= []

  def initialize(name, category)
    @name = name
    @category = category
    @@all << self
  end

  def self.all
    @@all
  end

  def contributors
    # Filter all articles,
    # get those where the magazine matches self
    Article.all.filter do |magazine|
      magazine.magazine == self
    end.collect do |magazines|
      # Then get the authors
      magazines.author
    end
  end

  def self.find_by_name(name)
    self.all.find do |magazine|
      magazine.name == name
    end
  end

  def article_titles
    # Find all articles in the magazine
    Article.all.filter do |magazine|
      magazine.magazine == self
    end.collect do |article|
      # And get he title
      article.title
    end
  end

  def contributing_authors
    # Find all articles in the magazine
    Article.all.select do |magazine|
      magazine.magazine == self
    end.collect do |author|
      # Get the author
      author.author
    end.uniq.collect do |article|
      # with more than 2 articles
      article.articles.count > 2
    end
  end

end