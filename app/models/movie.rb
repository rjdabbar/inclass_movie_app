class Movie < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :year_released, presence: true


  def self.search_for query
    where('title LIKE :query OR description LIKE :query', query: "%#{query}%")
  end
end
