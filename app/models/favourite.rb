class Favourite < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :property, dependent: :destroy
  validates :users_id, presence: true
  validates :properties_id, presence: true
end
