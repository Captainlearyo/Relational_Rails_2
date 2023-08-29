require 'rails_helper'

RSpec.describe 'the movies edit page' do

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


#   User Story 14, Child Update 
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
  it "has a link at the top for the directors show page" do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content("Update Movie")
    click_on "Update Movie"
    expect(current_path).to eq("/movies/#{@movie_1.id}/edit")
  end

  it "has a from to fill out information  " do
    visit "/movies/#{@movie_1.id}/edit"

    expect(page).to have_content("Edit Movie")
    expect(page).to have_field("Movie Name")
    expect(page).to have_field("Length")
    expect(page).to have_content("In Theaters")
    expect(page).to have_button(type: "submit")
    fill_in "Movie Name", with: "Biggest Movie"
    fill_in "Length", with: "098"
    choose "in_theaters_true"
    click_on 'Update Movie'
    expect(current_path).to eq("/movies/#{@movie_1.id}")
    expect(page).to have_content("Biggest Movie")
  end
end