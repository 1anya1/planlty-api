class PlantsController < ApplicationController

  def index
    if params[:todo_id]
      @todo = Todo.find(params[:todo_id])
      @plants = @todo.plants.all
      render json: @plants
    else
      @plants = Plant.all
      render json: @todos
    end
  end

  def show
    @plant = Plant.find(params[:id])
    @plant.todo_id = params[:todo_id]
    render json: @plant
  end

  # GET /plants/new
  def new
    @plant = Plant.new
  end

  # GET /plants/1/edit
  def edit
    @plant = Plant.find(params[:id])
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
    @plant = Plant.find(params[:id])
    if @plant.update(plant_params)
    else
      render :edit
    end
  end

  # DELETE /plants/1
  def destroy
    @plant = Plant.destroy(params[:id])
    render json: 204
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
 

    # Only allow a list of trusted parameters through.
    def plant_params
      params.require(:plant).permit(:water, :fertilize, :prune, :repot, :notes, :img, :date)
    end
end
