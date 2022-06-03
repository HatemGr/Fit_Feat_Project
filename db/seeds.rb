# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
City.destroy_all
Sport.destroy_all
User.destroy_all
SportUser.destroy_all


City.create!(name:"Lille")
City.create!(name:"Paris")
City.create!(name:"Toulouse")
City.create!(name:"Rennes")

Sport.create!(name: "Escalade")
Sport.create!(name: "Running")
Sport.create!(name: "Futsal")
Sport.create!(name: "Tennis")
Sport.create!(name: "Workout")

User.create!(email: "j@thp.com", password: "password",
            first_name: "Joffrey", city: City.find_by(name:"Toulouse")
            )
User.create!(email: "h@thp.com", password: "password",
            first_name: "Hatem", city: City.find_by(name:"Paris")
            )
User.create!(email: "f@thp.com", password: "password",
            first_name:"Foucauld", city: City.find_by(name:"Lille")
            )
User.create!(email: "l@thp.com", password: "password",
            first_name:"Lydia", city: City.find_by(name:"Rennes")
            )

colors = ["jaune", "vert", "bleu", "rouge", "violet"]
ranks = ["6", "15/1", "15/2", "15/3", "15/4", "15/5", "30", "31/1", "30/2", "30/3", "30/4", "40"]

10.times do
    User.create!(email: Faker::Internet.email,
            password: "password",
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            city: City.all.sample,
            birthdate: Faker::Date.between(from: 50.years.ago, to: 18.years.ago),
            tennis_frequency: Faker::Number.digit,
            workout_frequency: Faker::Number.digit,
            climbing_frequency: Faker::Number.digit,
            futsal_frequency: Faker::Number.digit,
            workout_experience: Faker::Number.digit,
            climbing_experience: Faker::Number.digit,
            futsal_experience: Faker::Number.digit,
            tennis_experience: Faker::Number.digit,
            tennis_rank: ranks.sample,
            climbing_level: Faker::Number.digit,
            climbing_block_color: colors.sample,
            workout_benchpress_weight: Faker::Number.digit,
            workout_squat_weight:Faker::Number.digit,
            running_distance: Faker::Number.digit,
            running_speed: Faker::Number.digit
        )
end


User.all.each do |user|
    Sport.all.each do |sport|
        SportUser.create!(user: user, sport: sport)
    end
end
