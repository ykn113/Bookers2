class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def show
    @books=Book.all
  end

  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
