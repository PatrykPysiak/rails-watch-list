class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  validates :title, :overview, presence: true
  validates :title, :overview, length: { minimum: 1 }
  validates :title, uniqueness: true
end
