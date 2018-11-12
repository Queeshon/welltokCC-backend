class Api::V1::ArticlesController < ApplicationController

  def index
    @articles = Article.all
    render json: @articles
  end

  def create
    @article = Article.create(article_params)

    if @article.save
      render json: {
        article_id: @article.id,
        title: @article.title,
        description: @article.description,
        author: @article.author,
        created_at: @article.created_at,
        updated_at: @article.updated_at
      }
    else
      render json: @article.errors
    end
  end

  def update
    @article = Article.find_by(id: params[:id])
    @article.update(article_params)

    if @article.save
      render json: @article
    else
      render json: @article.errors
    end
  end

  def destroy
    Article.destroy(params[:id])
  end

  private

  def article_params
    params.permit(
      :article_id,
      :title,
      :description,
      :author,
      :created_at,
      :updated_at
    )
  end

end
