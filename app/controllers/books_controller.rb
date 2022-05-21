class BooksController < ApplicationController
  before_action :ensure_current_user, {only: [:edit, :update]}
  def ensure_current_user
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to book_path(@book.id)
    end
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end
  
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])  
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
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
    params.permit(:title, :body, :user_id)
  end
end
