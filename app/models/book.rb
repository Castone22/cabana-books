class Book < ApplicationResource
  self.include_format_in_path = false
  self.collection_name = 'volumes'
  self.site = 'https://www.googleapis.com/books/v1/'

  class << self
    # Have to override where rails tries to start making its collection.  I could write a new parser for this
    # (probably safer) but in the interest of time, just going to do this for now.
    private
      def instantiate_collection(collection, original_params = {}, prefix_options = {})
        result = collection_parser.new(collection['items']).tap do |parser|
          parser.resource_class  = self
          parser.original_params = original_params
        end.collect { |record| instantiate_record(record, prefix_options) }
        result.define_singleton_method(:total_pages){50}
        result.define_singleton_method(:current_page){original_params.fetch(:startIndex, 10).to_i/10}
        result.define_singleton_method(:limit_value){10}
        result
      end
  end
end
