require 'rails_helper'

RSpec.describe 'the movies index page' do

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

    # User Story 3, Child Index 

    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes
    # (data from each column that is on the child table) 

  it 'displays the movies and attributs' do
    visit '/movies'
    # expect(page).to have_content("bobs movie")
    # expect(page).to have_content(70)
    # expect(page).to have_content(false)

    expect(page).to have_content("bobs movie_2")
    expect(page).to have_content(700)
    expect(page).to have_content(true)

    expect(page).to have_content("bobs movie_3")
    expect(page).to have_content(40)
    expect(page).to have_content(true)
  end

  #   User Story 8, Child Index Link
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it "has a link at the top for the movies index page" do
    visit "/movies"

    within("#header") do
      expect(page).to have_content("All Movies")
      click_on "All Movies"
      expect(current_path).to eq("/movies")
    end
  end

  # User Story 9, Parent Index Link
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Parent Index
  it "has a link at the top for the directors index page" do
    visit "/directors"

    within("#header") do
      expect(page).to have_content("All Directors")
      click_on "All Directors"
      expect(current_path).to eq("/directors")
    end
  end

#   User Story 15, Child Index only shows `true` Records 
# As a visitor
# When I visit the child index
# Then I only see records where the boolean column is `true`

  it "only shows records true/In Theaters" do
    visit "/movies"

    expect(page).to have_content("bobs movie_2")
    expect(page).to have_content("bobs movie_3")
    #expect(page).to_not have_content("bobs movie")
    
    expect(page).to have_content("sals movie")
    expect(page).to have_content("sals movie_2")
    expect(page).to_not have_content("sals movie_3")

    expect(page).to have_content("dans movie")
    expect(page).to have_content("dans movie_2")
    expect(page).to_not have_content("dans movie_3")
  end

#   User Story 18, Child Update From Childs Index Page 
# As a visitor
# When I visit the `child_table_name` index page or a parent `child_table_name` index page
# Next to every child, I see a link to edit that child's info
# When I click the link
# I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14
it "has a link to edit each movie" do
  visit "/movies" 

  expect(page).to have_content("Edit bobs movie")
  expect(page).to have_content("Edit sals movie")
  expect(page).to have_content("Edit dans movie")

  click_link("Edit bobs movie_2")

  expect(current_path).to eq("/movies/#{@movie_2.id}/edit")
end
end