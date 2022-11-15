FactoryBot.define do
  factory :item do
      name                 {"名前"}
      explanation          {"テスト"}
      category_id          {2}
      condition_id         {2}
      delivery_charge_id   {2}
      prefecture_id        {2}
      sending_date_id      {2}
      price                {500}
      association :user
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  end
end