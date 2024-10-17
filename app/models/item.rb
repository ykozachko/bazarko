class Item < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true
end
