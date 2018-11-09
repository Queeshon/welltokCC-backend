class Api::V1::ArticlesController < ApplicationController

  def index
    @articles = Article.all
    newArticles = []
    @article.each { |article| newArticles.push({ article: article, author: battle.author, tags: battle.tags}) }
    render json: newArticles
  end

  def create
    @article = Article.create(article_params)

    if @article.save
      render json: {
        article_id: @article.id,
        title: @article.title,
        description: @article.description,
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
      :created_at,
      :updated_at
    )
  end

end
