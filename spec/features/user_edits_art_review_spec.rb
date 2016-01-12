feature "User updates review" do
  scenario "authenticated user visits update review page" do
    user = FactoryGirl.create(:user)
    art = FactoryGirl.create(:art)
    review = FactoryGirl.create(:review, art_id: art.id, user_id: user.id)

    sign_in(user)
    visit art_path(art)
    click_on "Edit this Review"

    expect(page).to have_button "Update"
  end

  scenario "authenticated user successfully fills out update form" do
    user = FactoryGirl.create(:user)
    art = FactoryGirl.create(:art)
    review = FactoryGirl.create(:review, art_id: art.id, user_id: user.id)

    sign_in(user)
    visit art_path(art)
    click_on "Edit this Review"

    fill_in "Comment", with: "This was SO TERRIBLE."
    click_on "Update Review"

    expect(page).to have_content "TERRIBLE"
  end

  scenario "authenticated user unsuccessfully fills out update form" do
    user = FactoryGirl.create(:user)
    art = FactoryGirl.create(:art)
    review = FactoryGirl.create(:review, art_id: art.id, user_id: user.id)

    sign_in(user)
    visit art_path(art)
    click_on "Edit this Review"

    fill_in "Comment", with: " "
    click_on "Update Review"

    expect(page).to have_content "You must fill out all of the required fields"
  end

  scenario "unauthenticated user is unable to edit art review" do
    art = FactoryGirl.create(:art)
    visit art_path(art)

    expect(page).to_not have_link "Edit this review"
  end

  scenario "authenticated user cannot edit review created by another user" do
    user = FactoryGirl.create(:user)
    art = FactoryGirl.create(:art)
    review = FactoryGirl.create(:review, art: art)

    sign_in(user)
    visit art_path(art)

    expect(page).to_not have_link "Edit this entry"
  end
end
