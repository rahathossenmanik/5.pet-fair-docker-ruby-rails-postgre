class PetTypeController < ApplicationController
  def index
    @petTypes = PetType.all
    render json: @petTypes, status: :ok
  end

  def show
    @petType = PetType.find(params[:id])
    render json: @petType, status: :ok
  end

  def create
    @petType = PetType.create!(petType_params)
    render json: @petType, status: :ok
  end

  def update
    @petType = PetType.find(params[:id])
    @petType.update!(petType_params)
    render json: @petType, status: :ok
  end

  def destroy
    petType = PetType.find(params[:id])
    petType.destroy!
    redirect_to petTypes_path
  end

  private
    def petType_params
      params.require(:pet_type).permit(:label)
    end
end
