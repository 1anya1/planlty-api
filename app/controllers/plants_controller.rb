class PlantsController < ApplicationController

  def index
    @plants = Plant.all
    render json: @plants
  end

  def show
    @plant = Plant.find(params[:id])
    # @todo.todo_id = params[:todo_id]
    render json: @plant
  end

  # GET /plants/new
  def new
    @plant = Plant.new
  end

  # GET /plants/1/edit
  def edit
  end

  # POST /plants
  def create
    @plant = Plant.new(plant_params)
    @plant.todo_id=params[:todo_id]
    if @plant.save
      render json: @plant, status: :created
    else
      render json: @plant.errors, status: :unprosessable_entry
    end
  end

  # PATCH/PUT /plants/1
  def update
    if @plant.update(plant_params)
    else
      render :edit
    end
  end

  # DELETE /plants/1
  def destroy
    @plant.destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
 

    # Only allow a list of trusted parameters through.
    def plant_params
      params.require(:plant).permit(:water, :fertilize, :prune, :repot, :notes, :img)
    end
end
