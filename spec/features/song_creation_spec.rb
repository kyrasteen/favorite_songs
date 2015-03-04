require 'rails_helper'

RSpec.describe "User creates a song" do
  context "with valid attributes" do
    it "saves and displays the song title" do
      # user = User.create(username:'k',password:'w')
      visit new_song_path 
      fill_in :title, :with => "My oh My"
      fill_in :artist, :with => "David Gray"
      click_link_or_button "Create Song"

      expect(page).to have_content('My oh My')
    end
  end
end
