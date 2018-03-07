require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'books are immutable as they are pulled from google books api' do
    book = Book.new
    begin
      book.save
    rescue ActiveResource::ResourceNotFound => e
      exception = e
    ensure
      assert exception.class.eql? ActiveResource::ResourceNotFound #because nil is still NilClass we can trust this.
    end
  end

end
