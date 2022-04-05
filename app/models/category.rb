class Category < ApplicationRecord
    validates :name, uniqueness: true, length: {maximum: 25, minimum: 2}
end