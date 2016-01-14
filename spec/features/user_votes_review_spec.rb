feature "user votes for review" do

  let(:user) { FactoryGirl.create(:user) }
  let(:art) { FactoryGirl.create(:art) }
  let(:review) { FactoryGirl.create(:review) }

  scenario "unauthenticated user does not see vote buttons" do
    create_and_view_review(art)

    expect(page).to_not have_button 'Upvote'
    expect(page).to_not have_button 'Downvote'
    expect(page).to have_link 'Sign in to upvote or downvote this review!'
  end


  scenario "authenticated user votes for the first time", js: true do
    skip("js:true tests pass locally, but not on codeship")
    sign_in(user)
    create_and_view_review(art)

    expect(page).to have_button("0 Upvotes")
    click_button "0 Upvotes"

    expect(page).to have_button '1 Upvote'
    expect(page).to have_button '0 Downvotes'
  end

  scenario "authenticated user changes vote", js: true do
    skip("js:true tests pass locally, but not on codeship")
    sign_in(user)
    create_and_view_review(art)

    click_button "0 Upvotes"

    click_button "0 Downvotes"

    expect(page).to have_button '0 Upvotes'
    expect(page).to have_button '1 Downvote'
  end

  scenario "authenticated user removes vote", js: true do
    skip("js:true tests pass locally, but not on codeship")
    sign_in(user)
    create_and_view_review(art)

    click_button "0 Upvotes"

      click_button "1 Upvote"

    expect(page).to have_button '0 Upvotes'
    expect(page).to have_button '0 Downvotes'
  end
end

def create_and_view_review(art)
  FactoryGirl.create(:review, art_id: art.id)
  visit art_path(art)
end
