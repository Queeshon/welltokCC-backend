class Api::V1::TagsController < ApplicationController

  def index
    @tags = Tag.all?
    render json: @tags
  end

  def create
    @tag = Tag.create(author_params)
    if @tag.save
      render json: {
        author_id: @tag.id,
        name: @tag.name
      }
    else
      render json: @tag.errors
    end
  end

  private

  def tag_params
    params.permit(:id, :name)
  end
