FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    first_name 'John'
    last_name 'Smith'
    password 'password'
    password_confirmation 'password'
  end

  factory :art do
    sequence(:id) { |n| }
    name "Chinatown Community Mural"
    location "Surface Rd & Beach St"
    description "Chinese community mural commissioned
    by the mayor's mural crew."
    artist "Unknown"
    category "mural"
  end

  factory :review do
    sequence(:id) { |n| }
    body "What a terrific work of street art!"
    rating 5
    # sequence(:art_id) { |n| }
    # sequence(:user_id) { |n| }
    art
    user
  end
end
