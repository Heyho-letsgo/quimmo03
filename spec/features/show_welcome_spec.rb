require "rails_helper"

feature "welcome" do
  scenario "show" do
    visit 'http://localhost:3000/welcome'
    expect(page).to have_text("QuimmoPro")
    expect(page).to have_text("Acquéreurs")

  end
end
