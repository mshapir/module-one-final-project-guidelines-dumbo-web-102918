def welcome
  puts "Hello! Welcome to ParkIt!"
end


def create_or_login
  prompt = TTY::Prompt.new
  $user = prompt.ask('What is your name?', default: ENV['USER'])
  User.find_or_create_by(name: $user)
  puts "Welcome #{$user}!"
end

def ask_user_what_he_wants_to_do
  prompt = TTY::Prompt.new
  prompt.select('What would you like to do?') do |menu|
    menu.choice 'Would you like to see all parking spots in a specific location?', 1
    menu.choice 'Would you like to see lisitngs priced lowest to highest?', 2, disabled: '(not working yet)'
    menu.choice 'Would you like to book a parking spot?', 3, disabled: '(out of stock)'
    menu.choice 'Would you like to see all your previous booked spots?', 4, disabled: '(not working yet)'
    menu.choice 'Would you like to delete all your previous booked spots?', 5, disabled: '(not working yet)'
    menu.choice 'Exit', 6

  end
end

def display_listings
  prompt = TTY::Prompt.new
  choices = %w(Brooklyn Queens)
prompt.multi_select("Select location?", choices)
end

def find_all_spots_by_location
  location = gets.chomp
  list = Listing.where(location: location)
  list.each do |lisitng|
    puts "#{listing.title}: #{lisitng.price} (#{lisitng.location})"
  end
end




#
# def create_new_user
#   puts "To create a user account please enter your name!"
#   name = gets.chomp
#   new_user = User.create(name: name)
#   puts "Hi #{new_user}! Welcome to ParkIt"
# end
#
# def login
#   puts "please login"
#   username = gets.chomp
#   $user = User.find_by(name: username)
#   puts "Welcome back, #{$user.name}!"
#   # if username ==
#   #   puts "oops! invalid login! please try again! "
#   #   login
#   # end
# end
#
# def create_or_login
#   puts "Please choose log in or create an account!"
#   response = gets.chomp.strip
#   # binding.pry
#   if response == "log in"
#     login
#   elsif response == "create an account"
#     create_new_user
#   else
#     puts "Sorry that an invalid entry try again!"
#     create_or_login
#   end
# end
#
# def logout
#   $user = nil
# end
#
# def getLocationFromUser
#   puts "Please put a location"
#   input = gets.chomp
# end
#
# def locationFromLowestToHighestPrice
#   puts "Where would you want to see price lowest to highest?"
#   getLocationFromUser
# end
#
# def display_listings(location)
#   listings = Listing.where(location: location).order(price: :asc)
#   listings.each do |listing|
#     puts "- #{listing.title}: #{listing.price} (#{listing.location})"
#   end
# end
# def book_listing
#   puts "What listing would you like to book"
#   input = gets.chomp
#
#  Listing.all.each do |lisitng|
#   if lisitng.title == input
#     $user.listings << lisitng
#   end
#
# end
#  puts "Congrats! You booked #{input}!"
# end
#
# def veiw_all_my_listings
#   puts "Would you like to view all of your previous booked listings"
#   input = gets.chomp
#   if input == "yes"
#   list = $user.listings
#   list.each do |listing|
#     puts "- #{listing.title}: #{listing.price} (#{listing.location})"
#   end
#   # binding.pry
# else
#   puts "Okay!"
#   end
# end
#
# def delete_all_lisitngs
#   puts "Do you want to delete all your previous listings?"
#   input = gets.chomp
#   if input == "yes"
#      $user.listings.destroy_all
#     puts "Deleted!"
#   else
#     puts "Okay!"
#   end
# end
