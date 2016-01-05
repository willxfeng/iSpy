feature "user deletes an entry" do
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
    
  scenario "user deletes an entry" do
    visit "/arts/#{art.id}"
    click_on "Delete this entry"

    expect(page).to_not have_content "Chinatown"
  end
end
