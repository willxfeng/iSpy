require 'rails_helper'

feature 'user signs in' do
  scenario "an existing user specifies valid email and password" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    expect(page).to have_content("Welcome Back!")
    expect(page).to have_content('Sign Out')
  end

  scenario "user supplies nonexistent email and password" do
    visit new_user_session_path
    fill_in 'Email', with: 'abc@xyz.com'
    fill_in 'Password', with: "plasshhwordd"
    click_button 'Sign In'

    expect(page).to have_content('Invalid email or password.')
    expect(page).to have_content('Sign Up Here!')
    expect(page).to_not have_content("Welcome Back!")
  end

  scenario "user supplies existing email with wrong password" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongpw'
    click_button 'Sign In'

    expect(page).to have_content('Invalid email or password.')
    expect(page).to have_content('Sign Up Here!')
    expect(page).to_not have_content('Sign Out!')
  end

  scenario "an already authenticated user cannot sign in again" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Sign in')

    visit new_user_session_path

    expect(page).to have_content('You are already signed in.')
    expect(page).to_not have_content('Sign in')
  end
end