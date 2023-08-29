require 'rails_helper'

RSpec.describe 'the directors edit page' do

  before do
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


  # User Story 12, Parent Update 
  # As a visitor
  # When I visit a parent show page
  # Then I see a link to update the parent "Update Parent"
  # When I click the link "Update Parent"
  # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
  # When I fill out the form with updated information
  # And I click the button to submit the form
  # Then a `PATCH` request is sent to '/parents/:id',
  # the parent's info is updated,
  # and I am redirected to the Parent's Show page where I see the parent's updated info
  it "has a link at the top for the directors show page" do
    visit "/directors/#{@director_1.id}"

    expect(page).to have_content("Update Director")
    click_on "Update Director"
    expect(current_path).to eq("/directors/#{@director_1.id}/edit")
  end

  it "has a from to fill out information  " do
    visit "/directors/#{@director_1.id}/edit"

    save_and_open_page
    expect(page).to have_content("Edit Director")
    expect(page).to have_field("Director Name")
    expect(page).to have_field("Age")
    expect(page).to have_content("Director Alive")
    expect(page).to have_button(type: "submit")
    fill_in "Director Name", with: "peter"
    fill_in "Age", with: "36"
    choose "alive_true"
    click_on 'Update Director'
    expect(current_path).to eq("/directors/#{@director_1.id}")
    expect(page).to have_content("peter")
    save_and_open_page
  end
end