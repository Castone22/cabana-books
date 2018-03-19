class BooksController < ApplicationController

  def index
    if params&.dig('book','search')
      @books = find_books_by_name params['book']['search'], page: params['page']
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def save_to_shelf
    book_id = params[:book]
    @book = Book.find(book_id)
    shelf_book
    redirect_back fallback_location: 'index'
  end

  private
    def find_books_by_name(name, page:)
      params = {q: name, country: 'US'}
      params[:startIndex] = page.to_i*10 if page
      Book.find(:all, params: params)
    end

    def shelf_book
      @shelf_book = ShelfBook.new
      @shelf_book.title = @book.sfetch(:volumeInfo)&.sfetch(:title)
      @shelf_book.description = @book.sfetch(:volumeInfo)&.sfetch(:description)
      @shelf_book.read = false
      @shelf_book.pages_read = 0
      @shelf_book.google_id = @book.sfetch(:id)
      @shelf_book.save
    end

end
