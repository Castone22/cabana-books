class BooksController < ApplicationController
  def index
    if params&.dig('book','search')
      @books = find_books_by_name params['book']['search'], page: params['page']
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private
    def find_books_by_name(name, page:)
      params = {q: name, country: 'US'}
      params[:startIndex] = page.to_i*10 if page
      Book.find(:all, params: params)
    end

end
