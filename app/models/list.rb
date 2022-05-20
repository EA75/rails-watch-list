class List < ApplicationRecord
  has_many :bookmarks
  has_one_attached :image
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
