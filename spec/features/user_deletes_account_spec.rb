require 'rails_helper'

feature 'user deletes account' do
  scenario 'successfully deletes account' do
    user = FactoryGirl.create(:user)

    visit root_path
    sign_in(user)

    click_link 'Edit Account'
    click_button 'Delete My Account'

    expect(page).to have_content(
      'Bye! Your account has been successfully cancelled.'
    )

    sign_in(user)

    expect(page).to have_content('Invalid email or password.')
    expect(page).to have_content('Sign Up Here!')
    expect(page).to_not have_content("Welcome Back!")
  end
end

def sign_in(user)
  click_link 'Sign In!'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Sign In'
end
