class PetController < ApplicationController
  def index
    @pets = Pet.all
    render json: @pets, status: :ok
  end

  def show
    @pet = Pet.find(params[:id])
    render json: @pet, status: :ok
  end

  def create
    @pet = Pet.create!(pet_params)
    render json: @pet, status: :ok
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update!(pet_params)
    render json: @pet, status: :ok
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy!
    render json: @pet, status: :ok
  end

  def getDogs
    @pets = Pet.where("petTypeId": 1)
    render json: @pets, status: :ok
  end

  def getCats
    @pets = Pet.where("petTypeId": 2)
    render json: @pets, status: :ok
  end

  def getBirds
    @pets = Pet.where("petTypeId": 3)
    render json: @pets, status: :ok
  end

  def getReptiles
    @pets = Pet.where("petTypeId": 4)
    render json: @pets, status: :ok
  end

  def loveReact
    @pet = Pet.find(params[:id])
    @pet.update!({:loveCount => @pet.loveCount + 1})
    render json: @pet, status: :ok
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :age, :petTypeId, :characterId, :about, :favorite, :image, :loveCount)
    end
end
