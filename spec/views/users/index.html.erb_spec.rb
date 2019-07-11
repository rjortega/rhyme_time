require "rails_helper"

describe "Route to views" do

 it 'has an index page' do
   visit '/users'

   expect(page.status_code).to eq(200)
 end

  it 'has an poem index page' do
    visit '/poems'
 
    expect(page.status_code).to eq(200)
  end

  it 'has an sign up page' do
    visit '/signup'
 
    expect(page.status_code).to eq(200)
  end

  it 'has an login page' do
    visit '/login'
 
    expect(page.status_code).to eq(200)
  end
end

describe 'Welcome navigate' do
    before do
      @poem = Poem.create(poem: "yo yo, i love you boo")
    end

  it 'displays a link to the edit page' do 
    visit poem_path(@poem.id)

    expect(page).to have_link(poem_path(@poem))
  end

  # it 'displays a link to the artist page' do 
  #   visit song_path(@song.id)

  #   expect(page).to have_link(@artist.name, href: artist_path(@artist))
  # end

  # it 'to song pages' do
  #   visit song_path(@song.id)
  #   expect(page.status_code).to eq(200)
  # end
end