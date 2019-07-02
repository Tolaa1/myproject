class UsersController < ApplicationController
    def index 
        @users = User.all 
        render json: @users 
    end 
    
    def show 
        @user = User.find_by(id: params[:id])
        if @user != nil
        render json: @user 
        else
            render json: {error: "user not found!"}, status: 404
         end
       end
   
    


    def user_params 
        params.require(:user).permit(:user_name, :password)
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            render :show, status: :created, location: @user 
        else 
            render json: @user.errors, status: :unprocessable_entity
        end
    end


    def update 
           @user =User.find_by(id: params[:user_id])
           if @user
              @user.comments.where(id: params[:id]).update(content: params[:content])
              render json: @user
            else
              render json:{error: "unable to update ratings"}, status: 400
            end
     end
end

