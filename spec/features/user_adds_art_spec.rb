require 'rails_helper'
feature "User adds street art" do
  scenario "user successfully fills out form and adds new art" do
    visit new_art_path

    fill_in "art_name", with: "Chinatown Community Mural"
    fill_in "art_location", with: "Surface Rd & Beach St"
    fill_in "art_description", with: "Chinese community mural commissioned
    by the mayor's mural crew."
    fill_in "art_artist", with: "Unknown"
    fill_in "art_category", with: "mural"
    click_on "Add New Art"

    expect(page).to have_content "Chinatown Community Mural"
    expect(page).to have_content "Surface Rd & Beach St"
    expect(page).to have_content "Chinese community mural commissioned by
    the mayor's mural crew."
    expect(page).to have_content "Unknown"
  end

  scenario "user unsuccessfully fills out form and remains on form page" do
    visit new_art_path

    fill_in "art_name", with: "Chinatown"
    click_on "Add New Art"

    expect(page).to have_content
      "Location can't be blank.
      Description can't be blank.
      Category can't be blank"
  end
end
