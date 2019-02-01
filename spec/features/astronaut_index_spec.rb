require 'rails_helper'

RSpec.describe 'when a visitor visits the astronaut index page', type: :feature do
  before :each do
    @mission_1 = Mission.create(title: 'Armageddon', time_in_space: 15)
    @mission_2 = Mission.create(title: 'Apollo 14', time_in_space: 5)
    @astronaut_1 = Astronaut.create(name: 'Alan Shepard', age: 40, job: 'Commander', missions: [@mission_1, @mission_2] )
    @astronaut_2 = Astronaut.create(name: 'Stuart Roosa', age: 25, job: 'Command Module Pilot', missions: [@mission_2])
    @astronaut_3 = Astronaut.create(name: 'Edgar Mitchell', age: 25, job: 'Lunar Module Pilot', missions: [@mission_2] )
  end
  it 'can see a list of astronauts, each with a name, age and job' do


    visit astronauts_path

    expect(page).to have_content("#{@astronaut_1.name}")
    expect(page).to have_content("Age: #{@astronaut_1.age}")
    expect(page).to have_content("Job: #{@astronaut_1.job}")

    expect(page).to have_content("#{@astronaut_2.name}")
    expect(page).to have_content("Age: #{@astronaut_2.age}")
    expect(page).to have_content("Job: #{@astronaut_2.job}")

    expect(page).to have_content("#{@astronaut_3.name}")
    expect(page).to have_content("Age: #{@astronaut_3.age}")
    expect(page).to have_content("Job: #{@astronaut_3.job}")

  end

  it 'can see the average age of all astronauts' do
    visit astronauts_path

    expect(page).to have_content("Average age: 30.0")
  end

  it 'can see a list of each astronaut\'s missions in alphabetical order' do
    visit astronauts_path

    expect(page).to have_content("Missions:\nArmageddon\nApollo 14")
  end
end
