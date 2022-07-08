FactoryBot.define do
  factory :worker do
    last_name { Faker::Name.last_name  }
    first_name { Faker::Name.first_name }
    age { 30 }
    role { "Manager" }
    active { "true" }
  end
end
