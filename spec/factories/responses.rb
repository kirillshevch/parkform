FactoryGirl.define do
  factory :response do
    email { Faker::Internet.email }
    data { [] }
  end
end
