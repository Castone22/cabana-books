class ShelfBook < ApplicationResource
  self.site = Rails.application.app_config[:shelf_api_url]
  self.collection_name = 'books'

end