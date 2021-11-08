FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number:6)}
    kanji_last            {"高橋"}
    kanji_first           {"由伸"}
    kana_last             {"タカハシ"}
    kana_first            {"ヨシノブ"}
    birth                 {Faker::Date.birthday(min_age: 18, max_age: 65)}
    email                 {Faker::Internet.free_email}
    password =  Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
  end
end
