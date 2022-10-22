# users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| nickname           | string | null: false               |
| birthday           | date   | null: false               |


- has_many :items
- has_one  :buy

# items テーブル
 
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| picture            | string     | null: false                    |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| delivery_charge    | integer    | null: false                    |
| prefecture         | string     | null: false                    |
| sending_date       | date       | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

- has_one    :buy
- belongs_to :user

# buys テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one    :address
# address テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     | null: false                    |
| phone              | string     | null: false                    |
| buys_id            | references | null: false, foreign_key: true |

- belongs_to :user