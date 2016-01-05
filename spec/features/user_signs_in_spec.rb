require 'rails_helper'

feature 'user signs in' do
  let(:user) { User.create(first_name: 'Will',
    last_name: 'Feng',
    email: 'willxfeng@gmail.com',
    password: 'password') }

  scenario "an existing user specifies valid email and password" do
    visit new_user_session_path
    click_link 'Sign in'
    fill_in 'Email', with: 'willxfeng@gmail.com'
    fill_in 'Password', with: 'password'

    expect(page).to have_content("Welcome!")
  end

  scenario "user supplies nonexistent email and password" do

  end

  scenario "user supplies existing email with wrong password" do

  end

  scenario "an already authenticated user cannot sign in again" do

  end
end
