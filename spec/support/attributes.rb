def user_attributes(overrides = {})
  {
    name: "Example User",
    email: "larry@example.com",
    password: "abracadabra",
    password_confirmation: "abracadabra",

  }.merge(overrides)
end