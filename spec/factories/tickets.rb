FactoryBot.define do
  factory :ticket do
    title { "SampleTitle" }
    description { "SampleDescription" }
    worker { "worker_id" }
    state { "Pending-InProgress-Done" }
    worker_name { "FirstName_LastName" }
  end
end
