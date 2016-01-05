require 'rails_helper'
feature "Visitors see index page" do
  scenario "Visitors see street art names" do
    visit "/"

    expect(page).to have_content "Welcome to iSpy"
  end

  scenario "Users can add their own art" do
    visit "/"
    click_on "Add New Street Art"

    expect(page).to have_content "Name:"
  end
end
