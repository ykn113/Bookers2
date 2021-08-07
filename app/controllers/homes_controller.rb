class HomesController < ApplicationController
  def top
  end

  def about
  end

  def book_search
    @user = current_user
    @book = Book.new
    @books = Book.book_search(params[:keyword])
  end
end
