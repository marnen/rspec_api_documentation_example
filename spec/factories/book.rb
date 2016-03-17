FactoryGirl.define do
  factory :book do
    author_first_name { Faker::Name.first_name }
    author_last_name { Faker::Name.last_name }
    title { Faker::Lorem.sentence }
  end
end
