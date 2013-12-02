class Movie < ActiveRecord::Base
  validates :title, presence: {:message => "Enter a title."}, uniqueness: {:message => "That movie already exists, please enter a different one."}
  validates :description, presence: true, length: { minimum: 10}
  validates :year_released, presence: true, numericality: {greater_than: 0}
  validates :rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  


  def self.search_for query
    where('title LIKE :query OR description LIKE :query', query: "%#{query}%")
  end
end
