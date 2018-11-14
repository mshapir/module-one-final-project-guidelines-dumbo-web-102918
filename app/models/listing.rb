class Listing < ActiveRecord::Base
  has_many :rentals
  has_many :users, through: :rentals

  # def self.find_all_by_location(location)
  #
  #   # location = gets.chomp
  #   Listing.where(location: location)
  # end
  #
  # def self.find_all_by_lowest_to_highest_price_in_my_location(location)
  #   self.find_all_by_location(location).order(price: :asc)
  # end
end
