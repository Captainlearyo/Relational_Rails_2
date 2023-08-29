require 'rails_helper'

RSpec.describe 'the directors index page' do

  before(:each) do
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

# User Story 1, Parent Index 
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
  it 'displays the directors names' do
    visit '/directors'
    expect(page).to have_content("bob")
    expect(page).to have_content("sal")
    expect(page).to have_content("dan")
  end

#   User Story 6, Parent Index sorted by Most Recently Created 
# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

  it 'list directors in order of recently created' do
    visit '/directors'
    expect(page).to have_content("dan")
    expect(page).to have_content("sal")
    expect(page).to have_content("bob")

    #expect(page.all(".director")[0]).to have_content("dan")
    #expect(page.all(".director")[1]).to have_content("sal")
    #expect(page.all(".director")[2]).to have_content("bob")
    
  end

  #   User Story 8, Child Index Link
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it "has a link at the top for the movies index page" do
    visit "/directors"

    within("#header") do
      expect(page).to have_content("All Movies")
      click_on "All Movies"
      expect(current_path).to eq("/movies")
    end
  end

  #   User Story 9, Parent Index Link

  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index

  it "has a link at the top for the directors index page" do
    visit "/movies"

    within("#header") do
      expect(page).to have_content("All Directors")
      click_on "All Directors"
      expect(current_path).to eq("/directors")
    end
  end

end
