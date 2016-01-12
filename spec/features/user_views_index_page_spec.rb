feature "Visitors see index page" do
  let(:user) { FactoryGirl.create(:user) }

  scenario "Visitors see street art names" do
    visit root_path

    expect(page).to have_content "Welcome to iSpy"
    expect(page).to_not have_link ("Add New Street Art")
    expect(page).to have_link ("Sign in to add new street art")
  end

  scenario "Authenticated users can add their own art" do
    visit root_path
    sign_in(user)
    click_on "Add New Street Art"

    expect(page).to have_content "Name:"
  end
end
