# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
SportUser.destroy_all
Participant.destroy_all
Suggestion.destroy_all
RunningPerformance.destroy_all
TennisPerformance.destroy_all 
WorkoutPerformance.destroy_all 
ClimbingPerformance.destroy_all 
FutsalPerformance.destroy_all 
Event.destroy_all
Sport.destroy_all
User.destroy_all
City.destroy_all


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
            first_name: "Joffrey",
            last_name: "Frexinet",
            city: City.find_by(name:"Toulouse"),
            address: "271 rue Gabriel Peri 92700 Colombes",
            )
User.create!(email: "h@thp.com", 
            password: "password",
            first_name: "Hatem", 
            last_name: "Gribi",
            city: City.find_by(name:"Paris"),
            address: "81 rue de Chatou 92700 Colombes",
            )
User.create!(email: "f@thp.com", 
            password: "password",
            first_name:"Foucauld", 
            last_name: "Beaumont",
            city: City.find_by(name:"Lille"),
            address: "46 rue Colbert 92700 Colombes",
            )
User.create!(email: "l@thp.com", 
            password: "password",
            first_name:"Lydia", 
            last_name: "Valena",
            city: City.find_by(name:"Rennes"),
            address: "267 rue des Gros Gres 92700 Colombes",
            )

colors = ["jaune", "vert", "bleu", "rouge", "violet"]
ranks = ["6", "15/1", "15/2", "15/3", "15/4", "15/5", "30", "31/1", "30/2", "30/3", "30/4", "40"]

10.times do
    User.create!(email: Faker::Internet.email,
            password: "password",
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            description: Faker::Lorem.paragraph,
            city: City.all.sample,
            birthdate: Faker::Date.between(from: 50.years.ago, to: 18.years.ago),
            address: Faker::Address.full_address,
        )
end


User.all.each do |user|
    rand(1..5).times do
        loop do
            sport = SportUser.new(user: user, sport: Sport.all.sample)
            sport.save ? break : false
        end
    end
end

puts "All Users created"

40.times do
    suggestion = Suggestion.new(partnera: User.all.sample, partnerb: User.all.sample)
    if suggestion.save 
        puts "Suggestion created"
    end
end

10.times do
    event = Event.new(
        title: Faker::Sports::Football.competition, 
        admin: User.all.sample, 
        city: City.all.sample, 
        sport: Sport.all.sample, 
        date: Faker::Time.between(from: Date.today - 10, to: Date.today + 40, format: :default),
    )

    if event.save 
        puts "Event created"
    else
        puts "Event canceled"
    end
end

30.times do
    participation = Participant.new(user: User.all.sample,event:Event.all.sample)
    if participation.save 
        puts "Participation created"
    end
end

User.all.each do |user|
    n = rand(1..5)
    case n
    when 1
        TennisPerformance.create(
            tennis_frequency: Faker::Number.digit,
            tennis_experience: Faker::Number.digit,
            tennis_rank: ranks.sample,
            user: user,
        )
    when 2
        WorkoutPerformance.create(
            workout_frequency: Faker::Number.digit,
            workout_experience: Faker::Number.digit,
            workout_benchpress_weight: Faker::Number.digit,
            workout_squat_weight:Faker::Number.digit,
            user: user,
        )
    when 3
        ClimbingPerformance.create(
            climbing_frequency: Faker::Number.digit,
            climbing_experience: Faker::Number.digit,
            climbing_level: Faker::Number.digit,
            climbing_block_color: colors.sample,
            user: user,
        )
    when 4
        RunningPerformance.create(
            running_frequency: Faker::Number.digit,
            running_experience: Faker::Number.digit,
            running_distance: Faker::Number.digit,
            running_speed: Faker::Number.digit,
            user: user,
        )
    else
        FutsalPerformance.create(
            futsal_experience: Faker::Number.digit,
            futsal_frequency:Faker::Number.digit,
            user: user,
        )
    end
end