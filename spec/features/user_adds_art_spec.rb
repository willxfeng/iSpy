require 'rails_helper'
feature "User adds street art" do
  before :each do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In!"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    click_link 'Add New Street Art'
  end

  scenario "user successfully fills out form and adds new photo" do
    add_art

    expect(page).to have_content "Chinatown Community Mural"
    expect(page).to have_content "Surface Rd & Beach St"
    expect(page).to have_content "Chinese community mural commissioned by
    the mayor's mural crew."
    expect(page).to have_content "Unknown"

    attach_file 'Photo', "#{Rails.root}/spec/support/images/soldier.jpg"
    fill_in "Caption", with: "Test"
    click_button "Create Photo"

    expect(page).to have_css("img[src*='soldier.jpg']")
    expect(page).to have_content "Test"
  end

  scenario "user uploads non-image file" do
    add_art

    attach_file 'Photo', "#{Rails.root}/spec/support/images/text.txt"
    fill_in "Caption", with: "Test"
    click_button "Create Photo"

    expect(page).to have_content("allowed types: jpg, jpeg, gif, png, bmp")
  end

  scenario "user unsuccessfully fills out form and remains on form page" do
    fill_in "art_name", with: "Chinatown"
    click_on "Create Art"

    expect(page).to have_content "Location can't be blank."
    expect(page).to have_content "Description can't be blank."
    expect(page).to have_content "Category can't be blank"
  end

  scenario "user is not signed in and cannot add art" do
    click_on 'Sign Out'
    expect(page).to_not have_content 'Sign Out'
    click_on 'Add New Street Art'
    add_art
    expect(page).to have_content "User can't be blank"
  end
end

def add_art
  fill_in "art_name", with: "Chinatown Community Mural"
  fill_in "art_location", with: "Surface Rd & Beach St"
  fill_in "art_description", with: "Chinese community mural commissioned
  by the mayor's mural crew."
  fill_in "art_artist", with: "Unknown"
  fill_in "art_category", with: "mural"
  click_on "Create Art"
end
