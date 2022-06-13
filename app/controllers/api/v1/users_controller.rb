class Api::V1::UsersController < ApplicationController
    def index
        @users=User.all
        render json: @users
    end

    def show
        @user=User.find(params[:id])
        render json: @user
    end


    def create

        @user= User.new(user_params)
        if @user
            @user.save
        render json: @user
        else
            render error:{error:'unable to create user'}, status: 400
        end 
    end

    def update
        @user=User.find(params[:id])
        if @user
            @user.update(user_params)
            render json:{message:'user updated sucessfully'}, status: 400
        else
            render json:{ error:'unable to create user'}, status: 200
        end

    end

    def destroy
        @user=User.find(params[:id])
        if @user
            @user.destroy
            render json:{message:'user deleted sucessfully'}, status: 400
        else
            render json:{ error:'unable to delete user'}, status: 200
        end

    end

    private

    def user_params
        params.require(:user).permit(:name,:post)
    end    
end