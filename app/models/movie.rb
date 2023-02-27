class Movie < ApplicationRecord
  has_many :bookmarks,
           before_remove: :check_if_remaining
  has_many :lists, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  def check_if_remaining(bookmarks)
    throw(:abort) unless bookmarks.empty?
  end
end
