class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]
  
    def index
        @todos = Todo.all
        render json: @todos
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
    private
    def todo_params
        params.required(:todo).permit(:title, :url)
    end

end