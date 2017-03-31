# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1= User.new()
user1.name="Bob"
user1.email="bob@bob.com"
user1.save

user2= User.new()
user2.name="Edith"
user2.email="edith@edith.com"
user2.save

event1= Event.new()
event1.title= "Graduation Party"
event1.location= "Bob's place"
event1.description= "Bob is graduating"
event1.date_and_time= Time.zone.now()
event1.host_id=user1.id
event1.save

invite=Invitation.new()
invite.attendee_id=user2.id
invite.event_id=event1.id
invite.save