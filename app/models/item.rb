class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true

  has_many_attached :images
end
