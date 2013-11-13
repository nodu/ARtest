class ArticlesController < ApplicationController
  def index
    articles = Article.includes(:comments).all  #don't need Articles.entries.all
    # @articles = Article.all  #don't need Articles.entries.all
        # queries 
    
    articles.each {|a| puts a.title}
    render json: articles.to_json( include: [:comments])
  end

  def show
    article = Article.includes(:comments).find(params[:id])
    render json: article.to_json( include: [:comments])

    #took out @ instance vars bc this has no views.
  end

  def create
  end

  def update
  end

  def destroy
  end
end
