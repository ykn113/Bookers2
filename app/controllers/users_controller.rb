class UsersController < ApplicationController
  def index
    @users=User.all
    @user=User.find(current_user.id)
    @book=Book.new
  end

  def show
    @books=Book.all
    @user=User.find(current_user.id)
    @book=Book.new
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
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
