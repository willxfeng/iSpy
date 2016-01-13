feature "Admin deletes review" do
  scenario "Admin deletes another user's review" do
    admin = FactoryGirl.create(:user, role: 'admin')
    user = FactoryGirl.create(:user)
    art = FactoryGirl.create(:art)
    review = FactoryGirl.create(:review, art_id: art.id, user_id: user.id)

    sign_in(admin)
    visit art_path(art)

    click_on "Delete this Review"

    expect(page).to have_content art.name
    expect(page).to_not have_content review.body
  end
end
