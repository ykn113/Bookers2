class BooksController < ApplicationController
  impressionist :actions=> [:show]

  def index
    @user = User.find(current_user.id)
    @books = Book.all.order(params[:sort])
    @book = Book.new
  end

  # def index
  #   @user = User.find(current_user.id)
  #   @book = Book.new
  #   @books = Book.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
  # end

  # def index
  #   @user = User.find(current_user.id)
  #   @book = Book.new
  #   to  = Time.current.at_end_of_day
  #   from  = (to - 6.day).at_beginning_of_day
  #   @books = Book.includes(:favorited_users).
  #     sort {|a,b|
  #       b.favorited_users.includes(:favorites).where(created_at: from...to).size <=>
  #       a.favorited_users.includes(:favorites).where(created_at: from...to).size
  #     }
  # end

  def show
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
    @newbook = Book.new
    @book_comment = BookComment.new
    impressionist(@book, nil, unique: [:ip_address])
  end

  def new
    @book = Book.new
  end

  def create
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice:'You have created book successfully.'
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id == current_user.id
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice:'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :rate, :category)
  end

end
