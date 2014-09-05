require "rails_helper"

feature "Viewing a user's profile page" do
  scenario "shows the user's details" do
    user = User.create!(user_attributes)

    visit user_url(user)

    expect(page).to have_text(user.name)
    expect(page).to have_text(user.email)

  end
end