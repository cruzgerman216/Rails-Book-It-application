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
end