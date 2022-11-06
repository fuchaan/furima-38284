FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    birthday              { Faker::Date.birthday }
    first_name            { '太郎' }
    last_name             { '佐々木' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'ササキ' }
  end
end
