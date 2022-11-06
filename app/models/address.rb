class Address < ApplicationRecord
  #validates :post_code,      presence: true
  #validates :prefecture_id,  presence: true
  #validates :municipalities, presence: true
  #validates :address,        presence: true
  #validates :phone,          presence: true
  #validates :buy,            presence: true

  belongs_to :buy
end
