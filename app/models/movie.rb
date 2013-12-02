class Movie < ActiveRecord::Base
  validates :title, presence: {message: "Enter a title."}, uniqueness: {message:  "That movie already exists, please enter a different one."}
  validates :description, presence: {message:  "Please enter a description"}, length: { minimum: 10, message: "The description must be at least 10 characters long."}
  validates :year_released, presence: {message: "Please enter a year realesed"}, numericality: {greater_than: 0, message: "The year must be greater than 0"}
  validates :rating, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: "Rating must be between 1-5"}
  


  def self.search_for query
    where('title LIKE :query OR description LIKE :query', query: "%#{query}%")
  end
end
