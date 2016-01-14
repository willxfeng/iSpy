feature "User updates art entry" do
  let(:user) { FactoryGirl.create(:user) }
  let(:art) { FactoryGirl.create(:art) }

  scenario "user visits update page" do
    sign_in(art.user)
    visit art_path(art)

    click_on "Edit this Entry"

    expect(page).to have_button "Update"
  end

  scenario "authenticated user successfully fills out update form" do
    sign_in(art.user)
    visit art_path(art)

    click_on "Edit this Entry"
    fill_in "art_artist", with: "Another Artist"
    click_on "Update Art"

    expect(page).to have_content "Another"
  end

  scenario "user unsuccessfully fills out update form" do
    sign_in(art.user)
    visit art_path(art)

    click_on "Edit this Entry"
    fill_in "art_location", with: " "
    click_on "Update Art"

    expect(page).to have_content "You must fill out all of the required fields"
  end

  scenario "unauthenticated user is unable to edit art entry" do
    visit art_path(art)

    expect(page).to_not have_link "Edit this entry"
  end

  scenario "authenticated user cannot edit entry created by another user" do
    sign_in(user)
    visit art_path(art)

    expect(page).to_not have_link "Edit this entry"
  end
end
