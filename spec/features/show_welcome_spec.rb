require "rails_helper"

feature "show welcome" do
  scenario "welcome/show" do
    visit 'http://localhost:3000'
    expect(page).to have_text("Quimmo")
    expect(page).to have_text("Acquéreurs")


  end
end
