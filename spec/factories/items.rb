FactoryBot.define do
  factory :item do
    name              { Faker::Name.initials(number: 6) }
    content           { Faker::Lorem.sentence }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    status_id         { Faker::Number.between(from: 2, to: 8) }
    fee_id            { Faker::Number.between(from: 2, to: 3) }
    place_id          { Faker::Number.between(from: 2, to: 48) }
    arrive_id         { Faker::Number.between(from: 2, to: 4) }
    price             { Faker::Number.number(digits: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
