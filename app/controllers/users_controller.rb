class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update]

    def new
        @user = User.new
      end
    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to new_user_path
          else
            render :new, status: :unprocessable_entity
          end
      end
    
      

    # def create
    #   @user = User.new
    
    #   @user.username = params[:user][:username]
    #   @user.email = params[:user][:email]
    #   @user.password = params[:user][:password]
    
    #   if @user.save
    #     redirect_to new_user_path
    #   else
    #     render 'new'
    #   end
    # end

    def edit
      render 'edit'
    end

    def update
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render 'edit'
      end
    end

    private

      def find_user
        @user = User.find(params[:id])
      end
      def user_params
        params.require(:user).permit(:username, :email, :password)
      end
    
end
