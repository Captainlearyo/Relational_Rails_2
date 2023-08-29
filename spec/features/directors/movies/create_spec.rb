require 'rails_helper'

RSpec.describe 'Parent Child Creation' do

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

#   User Story 13, Parent Child Creation 
# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed


  it "I see a link to add a new adoptable child for that parent 'Create Child'" do
    visit "/directors/#{@director_1.id}/movies"
    expect(page).to have_content("New Movie")
    click_on "New Movie"
    expect(current_path).to eq("/directors/#{@director_1.id}/movies/new")
  end

  it "contains a form to enter relevant attribute data" do
    visit "/directors/#{@director_1.id}/movies/new"
    
    expect(page).to have_field("Movie Name")
    expect(page).to have_field("Movie Length")
    expect(page).to have_content("In Theaters")
    expect(page).to have_button(type: "submit")
    fill_in "Movie Name", with: "the big movie"
    fill_in "Movie Length", with: "126"
    choose "in_theaters_true"

    click_on 'Create Movie'
    
    expect(current_path).to eq("/directors/#{@director_1.id}/movies")

    #check that director was addded to index

    expect(page).to have_content("bobs movie")
    expect(page).to have_content("bobs movie_2")
    expect(page).to have_content("bobs movie_3")
    expect(page).to have_content("the big movie")
    
  end
end