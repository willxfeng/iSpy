require 'spec_helper'

  feature "user can create an account", %Q{
    As a prospective user
    I want to create an account
    So that I can post items and review them} do

    scenario "user specifies valid and required info" do
      visit root_path
      click_link "Sign Up"
      fill_in "First Name", with: "Jon"
      fill_in "Last Name", with: "Smith"
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "Password"

      fill_in "Password Confirmation", with: "Password"
      click_button "Sign Up"

      expect(page).to have_content("You're in!")
      expect(page).to have_content("Sign Out")
    end

    scenario "user does not provide required information" do
      visit "/"

      click_button "Create User"
      expect(page).to have_content "Username can't be blank. Password can't be blank."
    end

    scenario "password confirmation does not match confirmation" do
      
    end
  end

end
