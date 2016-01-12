feature "user deletes an entry" do

  let(:user) { FactoryGirl.create(:user) }
  let(:art) { FactoryGirl.create(:art) }

  scenario "authenticated user deletes an entry" do
    sign_in(art.user)
    visit art_path(art)
    click_on "Delete this Entry"

    expect(page).to_not have_content "Chinatown"
  end

  scenario "unauthenticated user cannot delete art entry" do
    visit art_path(art)

    expect(page).to_not have_link "Delete this entry"
  end

  scenario "authenticated user cnanot delete another user's art entry" do
    sign_in(user)
    visit art_path(art)

    expect(page).to_not have_link "Delete this entry"
  end
end
