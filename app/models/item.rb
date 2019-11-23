class Item < ApplicationRecord
    # Validations
    validates_presence_of :name, :price, :image
end
