class Category < ApplicationRecord
  has_many :items, dependent: :destroy
  validates :name, presence: true, length: { minimum: 5 }
end
