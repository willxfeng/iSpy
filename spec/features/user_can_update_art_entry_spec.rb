feature "User updates art entry" do
  let(:art) do
    Art.create(
      name: "Chinatown Community Mural",
      location: "Surface Rd & Beach St",
      description: "Chinese community mural commissioned
      by the mayor's mural crew.",
      artist: "Made up Artist",
      category: "Graffiti"
    )
  end
  scenario "user visits update page" do
    visit "/arts/#{art.id}"
    click_on "Edit this Entry"

    expect(page).to have_button "Update"
  end
  scenario "user successfully fills out update form" do
    visit "/arts/#{art.id}"
    click_on "Edit this Entry"
    fill_in "art_artist", with: "Another Artist"
    click_on "Update"

    expect(page).to have_content "Another"
  end
  scenario "user unsuccessfully fills out update form" do
    visit "/arts/#{art.id}"
    click_on "Edit this Entry"
    fill_in "art_location", with: " "
    click_on "Update"

    expect(page).to have_content "You must fill out all of the required fields"
  end
end
