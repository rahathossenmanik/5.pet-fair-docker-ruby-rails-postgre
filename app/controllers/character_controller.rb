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
    # if @character.save
    #   render json: {status: "SUCCESS", message: "Character was created successfully!", data: @character}, status: :created
    # else
    #   render json: @character.errors, status: :unprocessable_entity
    # end
    # puts character_params
    # puts @character
    render json: @character, status: :created
    # friend = Friend.new(friend_params)

    # if friend.save
    #   render json: {status: "SUCCESS", message: "Friend was created successfully!", data: friend}, status: :created
    # else
    #   render json: friend.errors, status: :unprocessable_entity
    # end
  end

  def update
    character = Character.find(params[:id])
    character.update!(character_params)
    redirect_to character
  end

  def destroy
    character = Character.find(params[:id])
    character.destroy!
    redirect_to characters_path
  end

  private
    def character_params
      params.require(:label)
    end
end
