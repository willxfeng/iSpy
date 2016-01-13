feature 'admin deletes a registered user' do
  scenario 'admin deletes user from User index page' do
    admin = FactoryGirl.create(:user, role: 'admin')
    user = FactoryGirl.create(:user)
    sign_in(admin)
    click_link 'All Users'

    click_button "delete_#{user.id}"
    expect(page).to_not have_content(user.email)
  end
end
