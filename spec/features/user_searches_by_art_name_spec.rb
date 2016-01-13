feature "User searches for a specific piece of art by name" do

  let(:user) { FactoryGirl.create(:user) }
  let(:art) { FactoryGirl.create(:art) }

  scenario "user enters name in search bar and views search results" do
    visit "/"
    fill_in "search", with: art.name
    click_on "Search"

    expect(page).to have_content "#{art.name}"
  end

  scenario "user enters art name that does not match any existing art names" do
    visit "/"
    fill_in "search", with: "Fake Art"
    click_on "Search"

    expect(page).to_not have_content "#{art.name}"
    expect(page).to have_content "Sorry, no results"
  end
end
