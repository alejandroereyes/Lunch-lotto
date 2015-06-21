# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: "al", email: 'al@al.com', password: "al", password_confirmation: "al",
            network: 'Engineers', linked_in: "I'm awesome", twitter: 'hi', bio: "I'm still awesome")

User.create(name: "bob", email: 'bob@bob.com', password: "bob", password_confirmation: "bob",
            network: 'Engineers', linked_in: "do stuff", twitter: 'tweet', bio: "more stuff")

User.create(name: "joe", email: 'joe@joe.com', password: "joe", password_confirmation: "joe",
            network: 'Designers', linked_in: "hire me", twitter: 'holla', bio: "will work for netflix")

al = User.find_by(name: 'al')
bob = User.find_by(name: 'bob')
joe = User.find_by(name: 'joe')

Food.create(user_id: al[:id], easy_breezy: true, health_nut: false, wild_child: false,
            lux_lunch: false, casual_sit_down: false)

Food.create(user_id: bob[:id], easy_breezy: true, health_nut: false, wild_child: false,
            lux_lunch: false, casual_sit_down: true)

Food.create(user_id: joe[:id], easy_breezy: true, health_nut: false, wild_child: false,
            lux_lunch: false, casual_sit_down: false)
