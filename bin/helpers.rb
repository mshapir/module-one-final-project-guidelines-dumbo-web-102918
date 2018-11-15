require "colorize"
require "text-table"

def welcome
  # puts '______          _   ___  ___'
  # puts '| ___ \        | |  |  \/  |'
  # puts '| |_/ /_ _ _ __| | _| .  . | ___'
  # puts '|  __/ _` | `__| |/ / |\/| |/ _ \ '
  # puts '| | | (_| | |  |   <| |  | |  __/'
  # puts '\_|  \__,_|_|  |_|\_\_|  |_/\___|'

  puts '

██████╗  █████╗ ██████╗ ██╗  ██╗    ███╗   ███╗███████╗
██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝    ████╗ ████║██╔════╝
██████╔╝███████║██████╔╝█████╔╝     ██╔████╔██║█████╗
██╔═══╝ ██╔══██║██╔══██╗██╔═██╗     ██║╚██╔╝██║██╔══╝
██║     ██║  ██║██║  ██║██║  ██╗    ██║ ╚═╝ ██║███████╗
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝     ╚═╝╚══════╝

'.colorize(:color => :light_blue, :background => :green)
puts '
=====================================================================================================================================================================================
'.colorize(:light_blue)
end


def create_or_login
  prompt = TTY::Prompt.new
  user = prompt.ask('What is your name?', default: ENV['USER'])
  $user = User.find_or_create_by(name: user)
  system("Clear")
  welcome
#   puts '
# =====================================================================================================================================================================================
#   '.colorize(:light_blue)
  puts "Welcome #{user}!".colorize(:green)
#   puts '
# =====================================================================================================================================================================================
#   '.colorize(:light_blue)
end

def ask_user_what_he_wants_to_do
  # system "clear"
  prompt = TTY::Prompt.new
  user_choice = prompt.select('What would you like to do?') do |menu|
    menu.choice 'Would you like to see all parking spots in a specific location?', 1
    menu.choice 'Would you like to see listings priced lowest to highest?', 2
    menu.choice 'Would you like to book a parking spot?', 3
    menu.choice 'Would you like to see all your previous booked spots?', 4
    menu.choice 'Would you like to delete all your previous booked spots?', 5
    menu.choice 'Would you like to see total spent on parking spots?', 6
    menu.choice 'Exit', 7
  end

  if user_choice == 1
    display_listings_by_location
    puts '
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'.colorize(:green)
    ask_user_what_he_wants_to_do
   elsif user_choice == 2
    price_lowest_to_highest
    puts '
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'.colorize(:green)
    ask_user_what_he_wants_to_do
  elsif user_choice == 3
    book_listing
    puts '
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'.colorize(:green)
    ask_user_what_he_wants_to_do
   elsif user_choice == 4
    veiw_all_my_listings
    puts '
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'.colorize(:green)
    ask_user_what_he_wants_to_do
   elsif user_choice == 5
    delete_all_listings
    puts '
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'.colorize(:green)
    ask_user_what_he_wants_to_do
  elsif user_choice == 6
    total_spent
    puts '
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'.colorize(:green)
    ask_user_what_he_wants_to_do
  end

end

def price_lowest_to_highest
listings = Listing.order(price: :asc)
  listings.each do |listing|
    puts "- #{listing.title}: #{listing.price} (#{listing.location})".colorize(:blue)
  end
end

def display_listings_by_location
  prompt = TTY::Prompt.new
  choices = %w(Brooklyn Queens)
 user_choice = prompt.multi_select("Select location?", choices)

  find_all_spots_by_location(user_choice)
end

  # def choose_listing
  #   prompt = TTY::Prompt.new
  #
  # end


def find_all_spots_by_location(arg)
  list = Listing.where(location: arg)
  list.each do |listing|
    puts "#{listing.title}: #{listing.price} (#{listing.location})".colorize(:blue)
  end
end

def veiw_all_my_listings
  list = $user.listings
  list.each do |listing|
    puts "- #{listing.title}: #{listing.price} (#{listing.location})".colorize(:blue)
  end
end

def delete_all_listings
     $user.listings.destroy_all
     puts " "
    puts "Deleted!".upcase.colorize(:red)
end



def book_listing
  prompt = TTY::Prompt.new
  user_choice = prompt.select('Choose a listing to book.') do |menu|
    Listing.all.each_with_index do |listing, index|
      menu.choice "#{listing.title}: #{listing.price} (#{listing.location})", index + 1
    end
    menu.choice 'Exit', Listing.all.length + 1
  end

  listing = Listing.all[user_choice - 1]
  $user.listings << listing
  puts '
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'.colorize(:green)
  puts "Congratulations, you have just booked #{listing.title}: #{listing.price} (#{listing.location}). Enjoy your parking spot!".colorize(:blue)
end

def total_spent
  list = $user.listings
  sum  = list.map { |listing| listing.price }.reduce(:+).round(2)
  puts '
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'.colorize(:green)
  puts "You spent $#{sum} on parking spots.".colorize(:blue)
end
  # Listing.all.each do |listing|
  # if listing.title == user_choice
  #   $user.listings << listing
  # end

  # system "clear"




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
# def display_listings_by_location(location)
#   listings = Listing.where(location: location).order(price: :asc)
#   listings.each do |listing|
#     puts "- #{listing.title}: #{listing.price} (#{listing.location})"
#   end
# end
# def book_listing
#   puts "What listing would you like to book"
#   input = gets.chomp
#
#  Listing.all.each do |listing|
#   if listing.title == input
#     $user.listings << listing
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
# def delete_all_listings
#   puts "Do you want to delete all your previous listings?"
#   input = gets.chomp
#   if input == "yes"
#      $user.listings.destroy_all
#     puts "Deleted!"
#   else
#     puts "Okay!"
#   end
# end
