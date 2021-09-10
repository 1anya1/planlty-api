class UsersController < ApplicationController
    def index
        @users = User.all
        if @users
           render json: {
           users: @users
        }
       else
           render json: {
           status: 500,
           errors: ['no users found']
       }
      end
    end



    def show
        @user = User.find(params[:id])
        todos = @user.todos
           if @user 
                render json:  @user.to_json(include: :todos)
           else
              render json: {
              status: 500,
              errors: ['user not found']
            }
           end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!  
            render json: {
            status: :created,
            user: @user
        }
       else 
           render json: {
           status: 500,
           errors: @user.errors.full_messages
       }
       end
    end

    def destroy
        user = User.destroy(params[:id])
        render( status: 204)

    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end