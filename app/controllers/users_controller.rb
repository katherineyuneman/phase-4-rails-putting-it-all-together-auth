class UsersController < ApplicationController
    def create
        user = User.create!(user_params)
        if user.valid?
            session[:user_id] = user.user.id 
            render json: {user[:id], user[:uesrname], user[:image_url], user[:bio]}, status: :created_at
        else
            render json: {errors: "error message"}, status: :unprocessable_entity
    end

    private
    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end
end
