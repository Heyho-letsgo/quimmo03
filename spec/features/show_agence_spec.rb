require "rails_helper"

feature "Voir la page profile d'une agence" do
  scenario "Affiche les détails d'une agence" do
    agence = Agence.create!(agence_attributes)

    visit agence_url(agence)

    expect(page).to have_text(agence.raison_sociale)
    expect(page).to have_text(agence.siret)
    expect(page).to have_text(agence.num_rue)
    expect(page).to have_text(agence.adresse01l01)
    expect(page).to have_text(agence.adresse01l02)
    expect(page).to have_text(agence.adresse01l03)
    expect(page).to have_text(agence.code_postal)
    expect(page).to have_text(agence.ville)
    expect(page).to have_text(agence.region)
    expect(page).to have_text(agence.pays)
    expect(page).to have_text(agence.telephone)
    expect(page).to have_text(agence.fax)
    expect(page).to have_text(agence.email)


  end
end