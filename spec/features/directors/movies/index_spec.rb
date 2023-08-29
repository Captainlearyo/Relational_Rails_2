require 'rails_helper'

RSpec.describe 'the directors movie index page' do
  before :each do
    @director_1 = Director.create!(name: "bob",age: 5, alive:true)
    @movie_1 = @director_1.movies.create!(name: "bobs movie", length: 70, in_theaters: false)
    @movie_2 = @director_1.movies.create!(name: "bobs movie_2", length: 700, in_theaters: true)
    @movie_3 = @director_1.movies.create!(name: "bobs movie_3", length: 40, in_theaters: true)

    @director_2 = Director.create!(name: "sal",age: 90, alive:false)
    @movie_4 = @director_2.movies.create!(name: "sals movie", length: 70, in_theaters: true)
    @movie_5 = @director_2.movies.create!(name: "sals movie_2", length: 700, in_theaters: true)
    @movie_6 = @director_2.movies.create!(name: "sals movie_3", length: 40, in_theaters: false)

    @director_3 = Director.create!(name: "dan",age: 25, alive:true)
    @movie_7 = @director_3.movies.create!(name: "dans movie", length: 43, in_theaters: true)
    @movie_8 = @director_3.movies.create!(name: "dans movie_2", length: 66, in_theaters: true)
    @movie_9 = @director_3.movies.create!(name: "dans movie_3", length: 44, in_theaters: false)
  end

  it 'displays the directors movies' do
    visit "/directors/#{@director_1.id}/movies"
    expect(page).to have_content("bobs movie")
    expect(page).to have_content(70)
    expect(page).to have_content(false)

    expect(page).to have_content("bobs movie_2")
    expect(page).to have_content(700)
    expect(page).to have_content(true)

    expect(page).to have_content("bobs movie_3")
    expect(page).to have_content(40)
    expect(page).to have_content(true)

    expect(page).to_not have_content("sals movie_4")
  end

#   User Story 16, Sort Parent's Children in Alphabetical Order by name 
# As a visitor
# When I visit the Parent's children Index Page
# Then I see a link to sort children in alphabetical order
# When I click on the link
# I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
  it "has a link to sort movies alphabetically" do
    visit "/directors/#{@director_1.id}/movies"

    
    click_link("Alphabetize")
    
    expect(current_path).to eq("/directors/#{@director_1.id}/movies")

  end
end