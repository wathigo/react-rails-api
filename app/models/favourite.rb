class Favourite < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :property, dependent: :destroy
  validates :user, presence: true
  validates :property, presence: true
end
