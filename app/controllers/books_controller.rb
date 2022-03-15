class BooksController < ApplicationController 

    # Display all books
    # /books
    def index 
        @books = Book.all
    end

    # Display a certain book
    # /books/:id
    def show 
        @book = Book.find(params[:id])
    end

    def new 
        @book = Book.new
    end

    def create 
        @book = Book.new(params.require(:book).permit(:title, :description))

        if @book.save  
            flash[:notice] = "Book was saved!"
            redirect_to books_path
        else 
            render :new
        end
    end

    def edit 
        @book = Book.find(params[:id])
    end

    def update 
        @book = Book.find(params[:id])

        if @book.update(params.require(:book).permit(:title, :description))
            flash[:message] = "Updated successfully"
            redirect_to books_path
        else 
            render :edit
        end
    end

    def destroy 
        @book = Book.find(params[:id])
        @book.destroy 
        redirect_to books_path
    end 

end