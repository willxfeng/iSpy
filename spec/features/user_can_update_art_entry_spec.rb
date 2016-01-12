feature "User updates art entry" do
  scenario "user visits update page" do
    user = FactoryGirl.create(:user)
    new_art = FactoryGirl.create(:art, user_id: user.id)
    visit root_path
    click_link "Sign In!"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    visit art_path(new_art)
    click_on "Edit this Entry"

    expect(page).to have_button "Update"
  end
  scenario "user successfully fills out update form" do
    user = FactoryGirl.create(:user)
    new_art = FactoryGirl.create(:art, user_id: user.id)
    visit root_path
    click_link "Sign In!"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    visit art_path(new_art)
    click_on "Edit this Entry"
    fill_in "art_artist", with: "Another Artist"
    click_on "Update Art"

    expect(page).to have_content "Another"
  end
  scenario "user unsuccessfully fills out update form" do
    user = FactoryGirl.create(:user)
    new_art = FactoryGirl.create(:art, user_id: user.id)
    visit root_path
    click_link "Sign In!"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    visit art_path(new_art)
    click_on "Edit this Entry"
    fill_in "art_location", with: " "
    click_on "Update Art"

    expect(page).to have_content "You must fill out all of the required fields"
  end
end
