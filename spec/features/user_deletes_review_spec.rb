feature "User deletes review" do
  scenario "User deletes review" do
    user = FactoryGirl.create(:user)
    artwork = FactoryGirl.create(:art)
    review = FactoryGirl.create(:review, art_id: artwork.id, user_id: user.id)

    visit root_path
    click_link "Sign In!"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    visit art_path(artwork)

    click_on "Delete this Review"

    expect(page).to have_content artwork.name
    expect(page).to_not have_content review.body
  end

  scenario "User cannot delete review if not user's review" do
    user = FactoryGirl.create(:user)
    artwork = FactoryGirl.create(:art)
    review = FactoryGirl.create(:review, art: artwork)

    visit root_path
    click_link "Sign In!"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    visit art_path(artwork)

    expect(page).to_not have_content "Delete this Review"
  end
end
