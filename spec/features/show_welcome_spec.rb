require "rails_helper"

feature "show welcome" do
  scenario "welcome/show" do
    visit 'http://localhost:3000/welcome'
    expect(page).to have_text("QuimmoPro")
    expect(page).to have_text("Acquéreurs")
  end
end
