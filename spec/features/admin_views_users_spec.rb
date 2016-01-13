feature 'admin sees all registered users' do
  scenario 'admin visits users index' do
    admin = FactoryGirl.create(:user, role: 'admin')
    user = FactoryGirl.create(:user)
    sign_in(admin)
    click_link 'All Users'

    expect(page).to have_content(user.email)
  end
end
