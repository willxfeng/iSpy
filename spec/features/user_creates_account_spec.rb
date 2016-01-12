feature 'user can create an account' do

  before :each do
    visit root_path
    click_link "Sign Up Here!"
  end

  scenario "user specifies valid and required info" do

    attach_file 'Profile Photo', "#{Rails.root}/spec/support/images/soldier.jpg"
    fill_in "First Name", with: "Jon"
    fill_in "Last Name", with: "Smith"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "Password"

    fill_in "Password Confirmation", with: "Password"
    click_button "Sign up"

    expect(page).to have_content("You're in!")
    expect(page).to have_content("Sign Out")
    expect(page).to have_css("img[src*='soldier.jpg']")
  end

  scenario "user uploads non-image file" do
    attach_file 'Profile Photo', "#{Rails.root}/spec/support/images/text.txt"
    click_button "Sign up"

    expect(page).to have_content("allowed types: jpg, jpeg, gif, png, bmp")
  end

  scenario "user does not provide required information" do

    click_button "Sign up"
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario "password confirmation does not match confirmation" do

    fill_in "First Name", with: "Jon"
    fill_in "Last Name", with: "Smith"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "Password"

    fill_in "Password Confirmation", with: "123bleh"
    click_button "Sign up"

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end

end
