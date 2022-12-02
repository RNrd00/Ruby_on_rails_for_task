class BooksController < ApplicationController
  def index
    @books=Book.all.order(created_at: :asc)
    @book2=Book.new
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def create
   @book2 = Book.new(book_params)
   if @book2.save
    flash[:notice]="Book was successfully created."
   redirect_to  book_path(@book2.id)
   else
     @books = Book.all
     render :index
   end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
   @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice]="Book was successfully updated."
     redirect_to book_path(@book.id)
    else
    
    render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end