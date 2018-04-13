# require 'database_cleaner'
# DatabaseCleaner.strategy = :truncation
FactoryBot.define do

  
  factory :admin do
    first_name "Joe"
    last_name "Johnson"
    sequence :email do |n|
      "email#{n}@email.com"
    end
    password "djfalkdfjadklsfja"
  end

  factory :lead do
    first_name "Joseph"
    last_name "Josephson"
    email "joe@joe.joe"
    phone "8888888888"
    ip "124-222"
    city "Chicago"
    state "Illinois"
    zip "60615"
  end

  factory :event do
    name "woke up"
    lead
  end

  factory :outreach do
    text "rgsrug"
    lead
  end

  factory :setting do
    admin 
    auto_text_content "I believe in a thing called love"
  end
end

# DatabaseCleaner.clean
