class Movie < ApplicationRecord
  has_many :bookmarks
  validates :overview, presence: true, allow_blank: false
  validates :title, uniqueness: true
  validates :title, presence: true, allow_blank: false
end
