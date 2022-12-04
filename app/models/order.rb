class Order
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :municipalities, :building, :phone, :user_id, :item_id, :address
  validates :token, presence: true
  validates :post_code,      presence: true
  validates :prefecture_id,  presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipalities, presence: true
  validates :address,        presence: true
  validates :phone,          presence: true

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: @post_code, prefecture_id: @prefecture_id, municipalities: @municipalities, address: @address, building: @building, phone: @phone, buy_id: buy.id)
  end
end