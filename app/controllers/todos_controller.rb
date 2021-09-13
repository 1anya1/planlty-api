class TodosController < ApplicationController
    def index
        @todos = Todo.all
        render json: @todos
    end
    def show
        @todo = Todo.find(params[:id])
        @todo.user_id = params[:user_id]
        render json: @todo
    end
    def create
        @todo = Todo.new(todo_params)
        @todo.user_id = params[:user_id]
        if @todo.save
            render json: @todo, status: :created
        else
            render json: @todo.errors, status: :unprosessable_entity
        end
    end
  
    def destroy
        @todo = Todo.destroy(params[:id])
        render json: 204
    end

    private
    def todo_params
        params.required(:todo).permit(:title, :url)
    end

end