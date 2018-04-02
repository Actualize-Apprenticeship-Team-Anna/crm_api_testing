FactoryBot.define do

  
  factory :admin do
    first_name "Joe"
    last_name "Johnson"
    email "joeschmoe@gmail.com"
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
    sequence :lead_id 
  end

  factory :setting do
    sequence :admin_id 
    auto_text_content "I believe in a thing called love"
  end
end


