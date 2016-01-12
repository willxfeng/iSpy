feature "User updates review" do

  before :each do

    new_art = FactoryGirl.create(:art)
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
  end
  scenario "user visits update review page" do
    click_on "Edit this Review"

    expect(page).to have_button "Update"
  end

  scenario "user successfully fills out update form" do
    click_on "Edit this Review"
    fill_in "Comment", with: "This was SO TERRIBLE."
    click_on "Update Review"

    expect(page).to have_content "TERRIBLE"
  end

  scenario "user unsuccessfully fills out update form" do
    click_on "Edit this Review"
    fill_in "Comment", with: " "
    click_on "Update Review"

    expect(page).to have_content "You must fill out all of the required fields"
  end
end
