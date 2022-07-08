FactoryBot.define do
  factory :ticket do
    title { Faker::App.name }
    description { Faker::Marketing.buzzwords }
    worker { Faker::IDNumber.valid }
    state { "Pending" }
    worker_name { "#{Faker::Name.first_name} #{Faker::Name.last_name }" }
  end
end
