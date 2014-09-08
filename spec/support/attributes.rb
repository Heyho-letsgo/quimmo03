def user_attributes(overrides = {})
  {
    name: "Example User",
    email: "larry@example.com",
    password: "abracadabra",
    password_confirmation: "abracadabra",

  }.merge(overrides)
end




def agence_attributes(overrides = {})
  {
      raison_sociale: "Example Agence",
      siret: "1234567899999",
      num_rue: "123 bis",
      adresse01l01: "Adresse 01l1",
      adresse01l02: "Adresse 01l2",
      adresse01l03: "Adresse 01l3",
      code_postal: "75018",
      ville: "Paris",
      region: "Ile de France",
      pays: "France",
      telephone: "0909089766",
      fax: "765758976979",
      email: "info@agence.com",

  }.merge(overrides)
end
