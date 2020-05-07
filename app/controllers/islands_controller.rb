class IslandsController < ApplicationController
  before_action :set_island, only: %i[show update destroy]

  # GET /islands
  def index
    @islands = Island.all

    render json: @islands
  end

  # GET /islands/1
  def show
    render json: @island
  end

  # POST /islands
  def create
    @island = Island.new(island_params)

    if @island.save
      render json: @island, status: :created, location: @island
    else
      render json: @island.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /islands/1
  def update
    if @island.update(island_params)
      render json: @island
    else
      render json: @island.errors, status: :unprocessable_entity
    end
  end

  # DELETE /islands/1
  def destroy
    @island.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_island
    @island = Island.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def island_params
    params.require(:island).permit(:player_name, :island_name)
  end
end
