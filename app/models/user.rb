class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :first_name, :last_name,
            format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'が無効です。全角文字で入力してください' }
  validates :first_name_kana, presence: true
  validates :last_name_kana,  presence: true
  validates :first_name_kana, :last_name_kana,
            format: { with: /\A[ァ-ヶー－]+\z/, message: 'が無効です。全角カタカナで入力してください' }
  validates :nickname,        presence: true
  validates :birthday,        presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'が無効です。文字と数字の両方を含めて入力してください' }

  has_many :items
  has_many :buys
end
