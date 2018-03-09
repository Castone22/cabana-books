class ApplicationResource < ActiveResource::Base
end

class ActiveResource::Base
  # Safefetch
  # Attempts to perform a nilsafe fetch of an attribute from a given active resource record.
  # @param [symbol] attribute_name
  def sfetch(attribute_name)
    self&.attributes&.fetch(attribute_name, nil)
  end
end