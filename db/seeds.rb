User.destroy_all

user1 = User.create( name: "Bill")
user2 = User.create( name: "Tom")
user3 = User.create( name: "Kim")
user4 = User.create( name: "Sandy")
user5 = User.create( name: "John")
user6 = User.create( name: "Erica")
user7 = User.create( name: "Anik")
user8 = User.create( name: "Manny")
user9 = User.create( name: "Kevin")
user10 = User.create( name: "Eric")


Listing.destroy_all

listing1 = Listing.create(location: "Brooklyn" , title:"Parking near trains" , price: 12.00)
listing2 = Listing.create(location: "Brooklyn", title: "Driveway for rent near Coney Island", price: 7.99)
listing3 = Listing.create(location: "Brooklyn", title: "Parking close to Wework Dumbo", price: 14.99)
listing4 = Listing.create(location: "Brooklyn", title: "Parking near Prospect Park", price: 9.99)
listing5 = Listing.create(location: "Brooklyn", title: "Parking near Supreme Court", price: 17.99)
listing6 = Listing.create(location: "Queens", title: "Parking close to airport" , price: 14.99)
listing7 = Listing.create(location: "Queens", title: "Parking near Post Office", price: 4.99)
listing8 = Listing.create(location: "Queens", title: "Parking near High School" , price: 6.00)
listing9 = Listing.create(location: "Queens", title: "Parking near College", price: 7.00)
listing10 = Listing.create(location: "Queens", title: "Parking in Astoria", price: 11.00)

Rental.destroy_all

rental1 = Rental.create(user: user1, listing: listing1)
rental2 = Rental.create(user: user2, listing: listing2)
rental3 = Rental.create(user: user3, listing: listing3)
rental4 = Rental.create(user: user4, listing: listing4)
rental5 = Rental.create(user: user5, listing: listing5)
rental6 = Rental.create(user: user6, listing: listing6)
rental7 = Rental.create(user: user7, listing: listing7)
rental8 = Rental.create(user: user8, listing: listing8)
rental9 = Rental.create(user: user9, listing: listing9)
rental10 = Rental.create(user: user10, listing: listing10)
rental11 = Rental.create(user: user1, listing: listing2)
rental12 = Rental.create(user: user2, listing: listing3)
rental13 = Rental.create(user: user3, listing: listing4)
