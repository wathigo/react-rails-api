class Property < ApplicationRecord
  belongs_to :category, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
