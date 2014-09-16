require "rails_helper"

feature "Sign In" do
  scenario "prompts for an email and password" do
    visit root_url
    click_link 'QuimmoPro SignIn'


    expect(current_path).to eq(signin_path)

    expect(page).to have_field("Email")
    expect(page).to have_field("Password")

  end



end
