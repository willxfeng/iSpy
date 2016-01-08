feature "User updates review" do

  before :each do
    new_art = Art.create(
      name: "Chinatown Community Mural",
      location: "Surface Rd & Beach St",
      description: "Chinese community mural commissioned
      by the mayor's mural crew.",
      artist: "Made up Artist",
      category: "Graffiti"
    )
      user = FactoryGirl.create(:user)
      visit root_path
      click_link "Sign In!"
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign In'

      review = Review.create(
      body: "This was the greatest mural I have ever seen!",
      rating: 5,
      user_id: user.id,
      art_id: new_art.id
      )
    end
    scenario "user visits update review page" do
      visit "/arts/#{art.id}"
      click_on "Edit this Review"

      expect(page).to have_button "Update"
    end
    scenario "user successfully fills out update form" do
      visit "/arts/#{art.id}"
      click_on "Edit this Review"
      fill_in "Comment", with: "This was SO TERRIBLE."
      click_on "Update Review"

      expect(page).to have_content "TERRIBLE"
    end
    scenario "user unsuccessfully fills out update form" do
      visit "/arts/#{art.id}"
      click_on "Edit this Review"
      fill_in "Comment", with: " "
      click_on "Update Review"

      expect(page).to have_content "You must fill out all of the required fields"
    end
  end
end
