require "rails_helper"

feature "home" do
  scenario "show" do
    visit 'http://localhost:3000/home'
    expect(page).to have_text("QuimmoPro SignIn")
    expect(page).to have_text("Home")

  end
end
