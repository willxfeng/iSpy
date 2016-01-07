require 'rails_helper'
feature "User adds review street art" do
  scenario "user successfully fills out form and adds new review" do
    new_art = Art.create(
      name: "Chinatown Community Mural",
      location: "Surface Rd & Beach St",
      description: "Chinese community mural commissioned
      by the mayor's mural crew.",
      artist: "Made up Artist",
      category: "Graffiti",
      )
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In!"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    visit art_path(new_art)
    click_on "Add New Review"

    fill_in "body", with: "This was the greatest mural I have ever seen!"
    fill_in "rating", with: 5
    click_on "Add"

    expect(page).to have_content "This was the greatest mural I have ever seen!"
    expect(page).to have_content "5"
  end

  scenario "user unsuccessfully fills out form and remains on form page" do
    new_art = Art.create(
      name: "Chinatown Community Mural",
      location: "Surface Rd & Beach St",
      description: "Chinese community mural commissioned
      by the mayor's mural crew.",
      artist: "Made up Artist",
      category: "Graffiti",
      )
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In!"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Sign In"

    visit art_path(new_art)
    click_on "Add New Review"

    fill_in "body", with: "Cool"
    click_on "Add"

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content "Cool"
  end
end
