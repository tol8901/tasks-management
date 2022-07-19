FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2022-07-19 17:05:44" }
  end
end
