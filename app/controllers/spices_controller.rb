class SpicesController < ApplicationController
  def show
    spices = Spice.all
    render json: spices
  end

  # def index
  #   spices = spice_params
  #   if spices
  #     render json: spices, status: :ok
  #   else
  #     render json: 404, status: :not_found
  #   end
  # end

  def create
    spices = spice_params
    render json: spices, status: :created
  end

  def delete
    spices = find_spice
    if spices
      spices.destroy
    else
      render json: { error: "Spices could not be found" }
    end
  end

  def update
    spices = find_spice
    if spices
      spices.update(spice_param)
      render json: spices
    else
      render json: { error: "Spice could not be updated" }, status: :unprocessable_entity
    end
  end

  private

  def find_spice
    Spice.find_by(id: params[:id])
  end

  def spice_params
    Spice.create(title: params[:title], image: params[:image], description: params[:description], notes: params[:notes], rating: params[:rating])
  end

  def spice_param
    params.permit(:title, :image, :description, :notes, :rating)
  end
end
