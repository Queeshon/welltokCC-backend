class Api::V1::AuthorsController < ApplicationController

  def index
    @authors = Author.all?
    render json: @authors
  end

  def create
    @author = Author.create(author_params)
    if @author.save
      render json: {
        author_id: @author.id,
        name: @author.name
      }
    else
      render json: @author.errors
    end
  end

  def update
    @author = Author.find_by(id: params[:id])
    if @author.update
      render json: @author
    else
      render json: @author.errors
    end
  end

  def destroy
    Author.destroy(params[:id])
  end

  private

  def author_params
    params.permit(:id, :name)
  end

end
