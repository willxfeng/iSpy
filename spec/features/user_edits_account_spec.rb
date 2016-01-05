require 'rails_helper'

feature 'user edits account' do
  scenario "an existing user changes email and password" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link 'Edit Account'

    fill_in 'Email', with: 'new_email@example.com'
    fill_in 'Password', with: 'newpassword'
    fill_in 'Password Confirmation', with: 'newpassword'
    fill_in 'Current Password', with: user.password
    click_button 'Update'

    expect(page).to have_content("Your account has been updated successfully.")
    expect(page).to have_content('Sign Out')
  end

  scenario 'user does not provide required information' do

  end

  scenario "new password and confirmation do not match" do
  end

  scenario "user supplies wrong current password" do
  end

  scenario "user cannot access page without signing in" do
  end
end
