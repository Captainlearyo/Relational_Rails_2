require 'rails_helper'

RSpec.describe 'the movies index page' do
  @director_1 = Director.create!(name: "bob",age: 5, alive:true)
  @movie_1 = @director_1.movies.create!(name: "bobs movie", length: 70, in_theaters: false)
  @movie_2 = @director_1.movies.create!(name: "bobs movie_2", length: 700, in_theaters: true)
  @movie_3 = @director_1.movies.create!(name: "bobs movie_3", length: 40, in_theaters: true)

    # User Story 3, Child Index 

    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes
    # (data from each column that is on the child table) 

  it 'displays the movies and attributs' do
    visit '/movies'
    save_and_open_page
    expect(page).to have_content("bobs movie")
    expect(page).to have_content(70)
    expect(page).to have_content(false)

    expect(page).to have_content("bobs movie_2")
    expect(page).to have_content(700)
    expect(page).to have_content(true)

    expect(page).to have_content("bobs movie_3")
    expect(page).to have_content(40)
    expect(page).to have_content(true)
  end
end