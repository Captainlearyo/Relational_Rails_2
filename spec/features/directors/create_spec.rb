require 'rails_helper'

RSpec.describe 'create directors page' do

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

  # User Story 11, Parent Creation 
  # As a visitor
  # When I visit the Parent Index page
  # Then I see a link to create a new Parent record, "New Parent"
  # When I click this link
  # Then I am taken to '/parents/new' where I  see a form for a new parent record
  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.

  it "has a link to create a new Parent record" do
    visit "/directors"
    expect(page).to have_content("New Director")
    click_on "New Director"
    expect(current_path).to eq("/directors/new")
  end

  it "contains a form to enter relevant attribute data" do
    visit "/directors/new"
    
    expect(page).to have_field("Director Name")
    expect(page).to have_field("Director Age")
    expect(page).to have_content("Director Alive")
    expect(page).to have_button(type: "submit")
    fill_in "Director Name", with: "perry"
    fill_in "Age", with: "36"
    choose "alive_true"

    click_on 'Create Director'
    
    expect(current_path).to eq("/directors")

    #check that director was addded to index

    expect(page).to have_content("bob")
    expect(page).to have_content("sal")
    expect(page).to have_content("dan")
    expect(page).to have_content("perry")
    
  end
end