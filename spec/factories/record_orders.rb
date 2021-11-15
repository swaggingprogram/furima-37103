FactoryBot.define do
  factory :record_order do
    token { "tok_abcdefghijk00000000000000000" }
    postal_code { "123-4567" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { "大阪市" }
    port { Faker::Name.initials(number: 6) }
    building { Faker::Name.initials(number: 6) }
    tel { Faker::Number.number(digits: 11)}
    association :user
    association :item
  end
end
