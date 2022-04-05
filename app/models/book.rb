class Book < ApplicationRecord
  belongs_to :user

  has_many :book_categories
  has_many :categories, through: :book_categories 


  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  validates :description, presence: true, length: { minimum: 6, maximum: 200 }

  validate :image_path_exists

  def image_path_exists
    require "open-uri"
    begin
      path = URI.open(image_path)
      errors.add(:image_path, "does not contain image path") and return unless path.content_type.starts_with?("image")
    rescue
      errors.add(:image_path, "invalid url")
    end
  end
end


