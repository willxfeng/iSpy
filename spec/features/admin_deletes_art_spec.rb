feature "admin deletes an art entry" do
  scenario "authenticated user deletes an entry" do
    admin = FactoryGirl.create(:user, role: 'admin')
    user = FactoryGirl.create(:user)
    art = FactoryGirl.create(:art, user_id: user.id)

    sign_in(admin)
    visit art_path(art)
    click_on "Delete this Entry"

    expect(page).to_not have_content "Chinatown"
  end
end
