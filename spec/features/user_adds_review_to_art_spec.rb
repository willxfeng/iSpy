feature "User adds review street art" do

  let(:user) { FactoryGirl.create(:user) }
  let(:art) { FactoryGirl.create(:art) }

  scenario "authenticated user successfully fills out form, adds new review" do
    sign_in(user)
    visit art_path(art)

    click_on "Add New Review"

    fill_in "Comments", with: "This was the greatest mural I have ever seen!"
    fill_in "Rating", with: 5
    click_on "Create Review"

    expect(page).to have_content "This was the greatest mural I have ever seen!"
    expect(page).to have_content "5"
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario "user unsuccessfully fills out form and remains on form page" do
    sign_in(user)
    visit art_path(art)

    click_on "Add New Review"

    fill_in "Comments", with: "Cool"
    click_on "Create Review"

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content "Cool"
    expect(ActionMailer::Base.deliveries.count).to eq(0)
  end

  scenario "unauthenticated user cannot add review" do
    visit art_path(art)

    expect(page).to_not have_link "Add New Review"
    expect(page).to have_link "Sign in to add a new review!"
  end

end
