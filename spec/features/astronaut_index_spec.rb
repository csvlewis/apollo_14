require 'rails_helper'

RSpec.describe 'when a visitor visits the astronaut index page', type: :feature do
  it 'can see a list of astronauts, each with a name, age and job' do
    mission_1 = Mission.create(title: 'Apollo 14', time_in_space: 5)
    mission_2 = Mission.create(title: 'Armageddon', time_in_space: 15)
    astronaut_1 = Astronaut.create(name: 'Alan Shepard', age: 48, job: 'Commander', missions: [mission_1, mission_2] )
    astronaut_2 = Astronaut.create(name: 'Stuart Roosa', age: 38, job: 'Command Module Pilot', missions: [mission_1])
    astronaut_3 = Astronaut.create(name: 'Edgar Mitchell', age: 41, job: 'Lunar Module Pilot', missions: [mission_1] )

    visit astronauts_path

    expect(page).to have_content("Name: #{astronaut_1.name}")
    expect(page).to have_content("Name: #{astronaut_1.age}")
    expect(page).to have_content("Name: #{astronaut_1.job}")

    expect(page).to have_content("Name: #{astronaut_2.name}")
    expect(page).to have_content("Name: #{astronaut_2.age}")
    expect(page).to have_content("Name: #{astronaut_2.job}")

    expect(page).to have_content("Name: #{astronaut_3.name}")
    expect(page).to have_content("Name: #{astronaut_3.age}")
    expect(page).to have_content("Name: #{astronaut_3.job}")

  end
end
