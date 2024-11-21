class Item < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
    attachable.variant :normal, resize_to_limit: [800, 800]
  end

  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true
end
