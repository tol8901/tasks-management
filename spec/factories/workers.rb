FactoryBot.define do
  factory :worker do
    last_name { "SampleName" }
    first_name { "SampleSurname" }
    age { "SampleAge" }
    role { "SampleRole" }
    active { "true" }
  end
end
