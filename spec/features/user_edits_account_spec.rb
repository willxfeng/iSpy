require 'rails_helper'

feature 'user edits account' do

  before :each do
    @user = FactoryGirl.create(:user)
    visit new_user_session_path
  end

  scenario "an existing user changes email and password" do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign In'

    click_link 'Edit Account'

    fill_in 'Email', with: 'new_email@example.com'
    fill_in 'Password', with: 'newpassword'
    fill_in 'Password Confirmation', with: 'newpassword'
    fill_in 'Current Password', with: @user.password
    click_button 'Update'

    expect(page).to have_content("Your account has been updated successfully.")
    expect(page).to have_content('Sign Out')
  end

  scenario 'user does not provide required information' do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign In'

    click_link 'Edit Account'

    click_button 'Update'
    expect(page).to have_content("can't be blank")
  end

  scenario "new password and confirmation do not match" do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign In'

    click_link 'Edit Account'

    fill_in 'Email', with: 'new_email@example.com'
    fill_in 'Password', with: 'newpassword'
    fill_in 'Password Confirmation', with: 'new1password'
    fill_in 'Current Password', with: @user.password

    click_button 'Update'
    expect(page).to have_content("doesn't match")
  end

  scenario "user supplies wrong current password" do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign In'

    click_link 'Edit Account'

    fill_in 'Email', with: 'new_email@example.com'
    fill_in 'Password', with: 'newpassword'
    fill_in 'Password Confirmation', with: 'newpassword'
    fill_in 'Current Password', with: 'newwwwwwpasswordddd'

    click_button 'Update'
    expect(page).to have_content("Current password is invalid")
    expect(page).to have_content("Sign Out")
  end

  scenario "user cannot access page without signing in" do
    expect(page).to have_content('Sign In')
    expect(page).to_not have_content('Edit Account')
  end
end
