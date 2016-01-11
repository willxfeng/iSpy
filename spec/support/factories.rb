FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    first_name 'John'
    last_name 'Smith'
    password 'password'
    password_confirmation 'password'
  end

  factory :art do
    name "Chinatown Community Mural"
    location "Surface Rd & Beach St"
    description "Chinese community mural commissioned
    by the mayor's mural crew."
    artist "Unknown"
    category "mural"
  end

  factory :review do
    body "What a terrific work of street art!"
    rating 5
    art
    user
  end
end
