require 'rails_helper'

RSpec.describe "Registered user" do
  include Capybara::DSL

  it "Cannot log in without username and password" do
    visit login_path
    click_link_or_button('Sign in')
    expect(page).to have_content("Invalid login")
  end

  it "Logs in" do
    login_user
    expect(page).to have_content("kyra's dashboard")
  end

  it "Logs out and redirects to sign in" do
    login_user
    click_link_or_button("Logout")
    expect(page).to have_button('Sign in')
  end

end
