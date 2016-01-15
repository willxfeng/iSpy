feature 'admin edits user fole' do
  scenario 'admin makes a member admin, then back to member' do
    admin = FactoryGirl.create(:user, role: 'admin')
    FactoryGirl.create(:user)
    sign_in(admin)
    click_link 'All Users'

    click_button "Make Admin"
    click_button "Remove Admin Privilege"

    expect(page).to have_button("Make Admin")
  end
end
