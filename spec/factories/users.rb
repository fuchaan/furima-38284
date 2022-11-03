FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {Faker::Date.birthday}
    first_name            { "太郎"}
    last_name             { "山田"}
    first_name_kana       { "タロウ"}
    last_name_kana        { "ヤマダ"}
  end
end
