FactoryBot.define do
  factory :order do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {"123-4567"}
    prefecture_id        { 2 }
    municipalities  {"横浜市緑区"}
    address {"青山1-1-1"}
    phone {"09012345678"}
  end
end
