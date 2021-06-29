class BooksController < ApplicationController
  def index
    @user=User.find(current_user.id)
    @books=Book.all
  end

  def show
  end

  def new
    @book=Book.new
  end
  
  def create
    @book=Book.new
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(@book.id)
  end



  def edit
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
