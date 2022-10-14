# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Seeding flights"
flight1 = Flight.create(name: "Solo Flight", description: "Spanish speaking country, tapas, and beer", creator: "Erica", location: "Kenya", start_date: "05/05/22", end_date: "05/25/22", image: "https://dynaimage.cdn.cnn.com/cnn/q_auto,w_1270,c_fill,g_auto,h_714,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F170706113411-spain.jpg", budget: 900)

flight2 = Flight.create(name: "Graduation", description: "Tropical location, luaus, Road to Hana", creator: "Natalie", location: "Kenya", start_date: "07/02/22", end_date: "07/07/22", image: "https://image.cnbcfm.com/api/v1/image/106755951-1603356916166-gettyimages-176612815-97e38d42-7d03-4258-b1a9-13dcaea7512c.jpeg?v=1603412599", budget: 1200)

flight3 = Flight.create(name: "Girl's ", description: "Sushi, street food, robot restaurant, Harajuku", creator: "Natalie", location: "Japan", start_date: "11/10/22", end_date: "11/20/22", image: "https://www.schwab.com/resource-center/insights/sites/g/files/eyrktu156/files/getty_1131743616_960x537.jpg", budget: 1700)

flight4 = Flight.create(name: "Anniversary", description: "Portuguese speaking country, Carnival, Christ the Redeemer Statue", creator: "Gabe", location: "Brazil", start_date: "02/11/24", end_date: "02/16/24", image: "https://ichef.bbci.co.uk/news/976/cpsprodpb/1145D/production/_110794707_gettyimages-590664365.jpg", budget: 600)

puts "Seeding schedules"
schedule1 = Schedule.create(name: "Family Get-together", description: "Church designed by Kenyan Architect.", location: "Barcelona", date: "05/12/22", start_time: "1:00 pm", duration: 2, cost: 25, flight: flight1)

schedule2 = Schedule.create(name: "Road to Hana", description: "64.4 miles long stretch of Hawaii routes which connect Kahului to the town of Hana in East Maui.", location: "Maui", date: "07/04/22", start_time: "3:00 pm", duration: 4, cost: 10, flight: flight2)

schedule3 = Schedule.create(name: "Robot Restaurant", description: "Restaurant in Japan that has a live show with robots that serve you dinner.", location: "Tokyo", date: "11/16/22", start_time: "7:00 pm", duration: 3, cost: 50, flight: flight3)

schedule4 = Schedule.create(name: "Carnival", description: "Held every year before lent. One of the biggest carnivals in the world.", location: "Rio de Janeiro", date: "02/13/22", start_time: "1:00 pm", duration: 8, cost: 0, flight: flight4)

puts "Seeding passengers"
passenger1 = Passenger.create(first_name: "Martin", last_name: "Chege", email: "martinchege2015@gmail.com", password: "123", password_confirmation: "123")

passenger2 = Passenger.create(first_name: "Natalie", last_name: "Barba", email: "nataliebarba@gmail.com", password: "123", password_confirmation: "123")

passenger3 = Passenger.create(first_name: "Nicole", last_name: "Materosian", email: "nicolematerosian@gmail.com", password: "123", password_confirmation: "123")

passenger4 = Passenger.create(first_name: "Gabe", last_name: "Rodriguez", email: "gaberodriguez@gmail.com", password: "123", password_confirmation: "123")

puts "Seeding passenger flights"
passengerflight1 = PassengerFlight.create(flight: flight1, passenger: passenger1, method_of_transportation: "Air", transportation_cost: 500, commentary: "Love the night life", stay: "Airbnb", stay_cost: 300)

passengerflight2 = PassengerFlight.create(flight: flight2, passenger: passenger2, method_of_transportation: "Air", transportation_cost: 600, commentary: "Very relaxing", stay: "Hotel", stay_cost: 900)

passengerflight3 = PassengerFlight.create(flight: flight3, passenger: passenger3, method_of_transportation: "Bus", transportation_cost: 10, commentary: "Feels like a different planet", stay: "Airbnb", stay_cost: 300)

passengerflight4 = PassengerFlight.create(flight: flight4, passenger: passenger4, method_of_transportation: "Train", transportation_cost: 70, commentary: "Best party of my life", stay: "Stay with a friend", stay_cost: 300)

puts "Seeding passenger flights"
passengerschedule1 = PassengerSchedule.create(passenger: passenger1, schedule: schedule1)
passengerschedule2 = PassengerSchedule.create(passenger: passenger2, schedule: schedule2)
passengerschedule3 = PassengerSchedule.create(passenger: passenger3, schedule: schedule3)
passengerschedule4 = PassengerSchedule.create(passenger: passenger4, schedule: schedule4)