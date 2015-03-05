require 'rails_helper'

RSpec.describe "When registered", type: :feature do
  # include Capybara::DSL

  let(:rich) do
     User.create(username: 'Richard', password: 'LaBamba', role: 1)
   end

  it "user cannot view another users profile" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
    visit user_path(rich)
    within("#flash_alert") do
      expect(page).to have_content("Not authorized")
    end
  end

  xit "user can view their songs on their dashboard" do
    rich.songs.create(title:'My oh My', artist:'David Gray')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(rich)
    visit user_path(rich)
    within('.dashboard') do
      expect(page).to have_content("My oh My")
    end
    expect(page).not_to have_content("This years love")
  end

end
