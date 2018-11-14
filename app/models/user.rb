class User < ActiveRecord::Base
  has_many :rentals
  has_many :listings, through: :rentals




end
