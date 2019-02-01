# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Mission.create(title: 'Armageddon', time_in_space: 15)
Mission.create(title: 'Apollo 14', time_in_space: 5)
Astronaut.create(name: 'Alan Shepard', age: 40, job: 'Commander', missions: [Mission.find_by(name: 'Armageddon'), Mission.find_by(name: 'Apollo 14')] )
Astronaut.create(name: 'Stuart Roosa', age: 25, job: 'Command Module Pilot', missions: [Mission.find_by(name: 'Apollo 14')])
Astronaut.create(name: 'Edgar Mitchell', age: 25, job: 'Lunar Module Pilot', missions: [Mission.find_by(name: 'Apollo 14')] )
