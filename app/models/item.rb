class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many_attached :images

  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true
end
