class CharacterController < ApplicationController
  def index
    @characters = Character.all
    render json: @characters, status: :ok
  end

  def show
    @character = Character.find(params[:id])
    render json: @character, status: :ok
  end

  def create
    @character = Character.create!(character_params)
    render json: @character, status: :ok
  end

  def update
    @character = Character.find(params[:id])
    @character.update!(character_params)
    render json: @character, status: :ok
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy!
    render json: @character, status: :ok
  end

  private
    def character_params
      params.require(:character).permit(:label)
    end
end
