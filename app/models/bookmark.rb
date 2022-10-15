class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  validates :list_id, :movie_id, presence: true
  validates :comment, length: { minimum: 6 }
  validates :list_id, uniqueness: { scope: :movie_id }
end
