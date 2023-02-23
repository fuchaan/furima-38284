class Order
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :municipalities, :building, :phone, :user_id, :item_id, :address

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は無効です。次のように入力してください (例: 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :municipalities
    validates :address
    validates :phone, format: { with: /\A[0-9]+\z/, message: 'は無効です。半角数字で入力してください' }
  end
  validates :phone, format: { with: /\A\d{10,11}\z/, message: '番号が短いです。正しく入力してください' }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address,
                   building: building, phone: phone, buy_id: buy.id)
  end
end
