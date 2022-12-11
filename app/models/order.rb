class Order
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :municipalities, :building, :phone, :user_id, :item_id, :address

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :phone, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input only number' }
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'number is too short' }
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address,
                   building: building, phone: phone, buy_id: buy.id)
  end
end
