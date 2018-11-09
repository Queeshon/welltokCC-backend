class Api::V1::ArticlesController < ApplicationController

  def index
    @articles = Article.all
    render json: newArticles
  end

  def create
    @article = Article.create(article_params)

    if @article.save
      render json: @article
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
      render json: @article.
    end
  end

end
