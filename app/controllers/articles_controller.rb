class ArticlesController < ApplicationController

  before_action :get_article, except: [:index, :create]

  def index
    articles = Article.includes(:comments).to_a  #don't need Articles.entries.all
    # @articles = Article.all  #don't need Articles.entries.all
        # queries 
    
    # articles.each {|a| puts a.title}
    render json: articles.to_json( include: [:comments])
  end

  def show
    # article = Article.includes(:comments).find(params[:id])
    render json: @article.to_json( include: [:comments])

    #took out @ instance vars bc this has no views.
  end

  def create
    if article = Article.create(article_params)
      head :created, location: article_url(article)
    else
      render json: article.errors, status: :unprocessable_entity
    end

  end

  def update
    if @article = Article.update(article_params)
      head :no_content
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if 
      head ( @article.destroy ? :no_content : :method_not_allowed )
      
    end

  end

  private

  def get_article
    head :not_found unless @article = Article.includes(:comments).find(params[:id])
  end

  def article_params
    params.require(:article).permit(
      :title, :body, :published
      )
  end


end
