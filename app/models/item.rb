class Item < ApplicationRecord
  validates :name,               presence: true
  validates :explanation,        presence: true
  validates :category_id,        presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id,       presence: true
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_charge_id, presence: true
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id,      presence: true
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sending_date_id,    presence: true
  validates :sending_date_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,              presence: true
  validates :price,              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image,              presence: true

  has_one    :buy
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :sending
  belongs_to :delivery
end
