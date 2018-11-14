
## Deliverables
Building an app for a Parking Rentals in NYC.
- models are listings, user, rental
  - a listing (i.e. a parking spot) has many rentals
    - a listing has a location attribute which is a string of a location name, e.g. ' 1 - Brooklyn'
  - a user has many rentals
  - a rental belongs to a listing and a user


#### Listing
- #users
  - returns an array of all users who have stayed at a listing -->
- #rental
  - returns an array of all rental at a listing -->
- #rental_count
  - returns the number of rentals that have been taken to that listing
- .all
  - returns an array of all listings
- .find_all_by_location(location)
  - takes an argument of a location  (as a string) and returns all the listings for that location
 - .most_popular
  - finds the listing that has had the most rental

#### User
- #listings
  - returns an array of all listings a user has stayed at
- #rental
  - returns an array of all rentals a user has made
- #rental_count
  - returns the number of rentals a user has taken
 - .all
  - returns an array of all users
- .pro_parker
  - returns an array of all users who have made over 3 rentals
- .find_all_by_name(name)
  - takes an argument of a name (as a string), returns the all users with that name

#### Rental
- #listing
  - returns the listing object for the rental
- #user
  - returns the user object for the rental
- .all
  - returns an array of all rentals





### User functionality
- As a user I would like to see a list of all parking spots by location
- As a user I would like to see listings from cheapest price to highest
- As a user I would like to book a listing
- As a user I would like to see all listing I previously booked
- As a user I would like to delete all my previous listings 
