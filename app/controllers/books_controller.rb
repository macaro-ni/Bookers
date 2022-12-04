class BooksController < ApplicationController

  def index
    @book = Book.new
    @books =Book.all
  end

  def create
    book=Book.new(book_params)
    if book.save
      redirect_to book_path(book.id)
    else
      render :new
    end
    flash[:notice]="Book was successfully created."
    redirect_to book_path(book.id)
  end

  def update
    book=Book.find(params[:id])
    if book.update
      redirect_to book_path(@book.id)
    else
      render :new
    end
    flash[:notice]="Book was successfully updated."
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def show
    @book= Book.find(params[:id])
  end

  def edit
    @book= Book.find(params[:id])
  end
end

private
def book_params
  params.require(:book).permit(:title,:body)
end