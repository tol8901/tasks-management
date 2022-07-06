FactoryBot.define do
  factory :worker do
    last_name { "SampleName" }
    first_name { "SampleSurname" }
    age { 30 }
    role { "Manager" }
    active { "true" }
  end
end
