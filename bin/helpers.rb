def welcome
  puts "Hello! Welcome to ParkIt!"
end

def create_new_user
  puts "To create a user account please enter your name!"
  name = gets.chomp
  new_user = User.create(name: name)
  puts "Hi #{new_user}! Welcome to ParkIt"
end

def login
  puts "please login"
  username = gets.chomp
  $user = User.find_by(name: username)
  puts "Welcome back, #{$user.name}!"
  # if username ==
  #   puts "oops! invalid login! please try again! "
  #   login
  # end
end

def create_or_login
  puts "Please choose log in or create an account!"
  response = gets.chomp.strip
  # binding.pry
  if response == "log in"
    login
  elsif response == "create an account"
    create_new_user
  else
    puts "Sorry that an invalid entry try again!"
    create_or_login
  end
end

def logout
  $user = nil
end

def getLocationFromUser
  puts "Please put a location"
  input = gets.chomp
end

def locationFromLowestToHighestPrice
  puts "Where would you want to see price lowest to highest?"
  getLocationFromUser
end

def display_listings(location)
  listings = Listing.where(location: location).order(price: :asc)
  listings.each do |listing|
    puts "- #{listing.title}: #{listing.price} (#{listing.location})"
  end
end
def book_listing
  puts "What listing would you like to book"
  input = gets.chomp

 Listing.all.each do |lisitng|
  if lisitng.title == input
    $user.listings << lisitng
  end

end
 puts "Congrats! You booked #{input}!"
end

def veiw_all_my_listings
  puts "Would you like to view all of your previous booked listings"
  input = gets.chomp
  if input == "yes"
  list = $user.listings
  list.each do |listing|
    puts "- #{listing.title}: #{listing.price} (#{listing.location})"
  end
  # binding.pry
else
  puts "Okay!"
  end
end

def delete_all_lisitngs
  puts "Do you want to delete all your previous listings?"
  input = gets.chomp
  if input == "yes"
     $user.listings.destroy_all
    puts "Deleted!"
  else
    puts "Okay!"
  end
end
