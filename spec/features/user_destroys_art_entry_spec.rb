feature "user deletes an entry" do
  scenario "user deletes an entry" do
    user = FactoryGirl.create(:user)
    new_art = FactoryGirl.create(:art, user_id: user.id)
    visit root_path
    click_link "Sign In!"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    visit art_path(new_art)

    click_on "Delete this entry"

    expect(page).to_not have_content "Chinatown"
  end
end
