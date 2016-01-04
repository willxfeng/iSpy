require 'rails_helper'
feature "User adds street art" do
  scenario "user visits new art page" do
    visit "/arts/new"

    expect(page).to have_content "Name:"
    expect(page).to have_content "Location:"
    expect(page).to have_content "Description:"
    expect(page).to have_content "Artist:"
    expect(page).to have_button "Add"
  end

  scenario "user successfully fills out form and adds new art" do
    visit "/arts/new"

    fill_in "art_name", with: "Chinatown Community Mural"
    fill_in "art_location", with: "Surface Rd & Beach St"
    fill_in "art_description", with: "Chinese community mural commissioned
    by the mayor's mural crew."
    fill_in "art_artist", with: "Unknown"
    fill_in "art_category", with: "mural"
    click_on "Add"

    expect(page).to have_content "Chinatown Community Mural"
    expect(page).to have_content "Surface Rd & Beach St"
    expect(page).to have_content "Chinese community mural commissioned by
    the mayor's mural crew."
    expect(page).to have_content "Unknown"
  end

  scenario "user unsuccessfully fills out form and remains on form page" do
    visit "/arts/new"

    fill_in "art_name", with: "Chinatown"
    click_on "Add"

    expect(page).to have_content "You must fill out all of the required fields"
  end
end
