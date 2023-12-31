require 'rails_helper'

RSpec.describe 'the movies show page' do

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

# User Story 4, Child Show 
# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
  
  it 'displays the movies attributes' do
    visit "/movies/#{@movie_1.id}"
    expect(page).to have_content("bobs movie")
    expect(page).to have_content(70)
    expect(page).to have_content(false)
  end

  #   User Story 20, Child Delete 
# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child


  it "has a link to delete the movie" do
    visit "/movies"

    expect(page).to have_content("bobs movie_2")

    visit "/movies/#{@movie_2.id}"

    expect(page).to have_content("Delete bobs movie_2")
    click_link("Delete bobs movie_2")

    expect(current_path).to eq("/movies")
    expect(page).to_not have_content("bobs movie_2")
  end

end
