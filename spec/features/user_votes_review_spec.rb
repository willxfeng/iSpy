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
    sign_in(user)
    create_and_view_review(art)
binding.pry
    save_and_open_page
    expect(page).to have_button("0 Upvotes")
    click_button "0 Upvotes"

    expect_no_page_reload do
      expect(page).to have_button '1 Upvote'
      expect(page).to have_button '0 Downvotes'
    end
  end

  scenario "authenticated user changes vote", js: true do
    sign_in(user)
    create_and_view_review(art)
    save_and_open_page

    click_button "0 Upvotes"

    expect_no_page_reload do
      click_button "0 Downvotes"

      expect(page).to have_button '0 Upvotes'
      expect(page).to have_button '1 Downvote'
    end
  end

  scenario "authenticated user removes vote", js: true do
    sign_in(user)
    create_and_view_review(art)

    click_button "0 Upvotes"

    expect_no_page_reload do
      click_button "1 Upvote"

      expect(page).to have_button '0 Upvotes'
      expect(page).to have_button '0 Downvotes'
    end
  end
end

def create_and_view_review(art)
  FactoryGirl.create(:review, art_id: art.id)
  puts "art id: #{art.id}"
  visit art_path(art)
end
