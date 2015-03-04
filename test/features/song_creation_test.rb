require 'test_helper'

class SongCreationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can create a song" do
    visit new_song_path
    fill_in :title, :with => "My oh My"
    fill_in :artist, :with => "David Gray"
    click_link_or_button "Create Song"
    assert page.has_content?("My oh My")
  end
end
