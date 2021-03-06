# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    user
    text { Faker::Lorem.sentence(10) }
    url { Faker::Internet.url }
  end
end
