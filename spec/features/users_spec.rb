require 'rails_helper'

feature 'User Features' do

  let(:user){ create(:user) }

  before do
    visit root_path
  end

  scenario "add a new user" do
    click_link("Create New User")
    fill_in "Username", with: "JohnnyTsunami"
    find(".newuser").fill_in "Email", with: "jtsunami@gmail.com"
    find(".newuser").fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    expect{ click_button "Create User" }.to change(User, :count).by(1)
    expect(page).to have_content "User created"
  end

end