class CommentsController < ApplicationController
  def index
    article = Article.includes(:comments).find(params[:article_id])
    comments = article.comments

    render json: comments.to_json(
      include: [
        article: {
          only: [:title]
        }
        ],
        except: [:updated_at]
      )
      # includes the article associated with the comment
  end

  def show
    article = Article.includes(:comments).find(params[:article_id])
    comment = article.comments.find(params[:id])

    render json: comment.to_json(
      include: [
        article: {
          only: [:title]
        }
        ],
        except: [:updated_at]
      )
  end

  def create
  end

  def update
  end

  def destroy
  end
end
