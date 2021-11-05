# テーブル設計

## users テーブル

| Column             | Type   | Options                      |
| ------------------ | ------ | -----------                  |
| nickname           | string | null: false                  |
| kanji_last         | string | null: false                  |
| kanji_first        | string | null: false                  |
| kana_last          | string | null: false                  |
| kana_first         | string | null: false                  |
| birth              | integer| null: false,  activehash     |
| email              | string | null: false                  |
| encrypted_password | string | null: false                  |


### Association

- has_many :items
- has_many :orders

## items テーブル
  
| Column             | Type       | Options                          |
| ------             | ------     | -----------                      |
| name               | string     | null: false                      |
| content            | text       | null: false                      |
| category           | integer    | null: false  activehash          |
| status             | integer    | null: false  activehash          |
| fee                | integer    | null: false  activehash          |
| place              | integer    | null: false  activehash          |
| ship_date          | integer    | null: false  activehash          |
| price              | integer    | null: false                      |
| user               | references | null: false, foreign_key: true   |                   
  
### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column       | Type       | Options                                |
| -------      | ---------- | ------------------------------         |
| price        | integer    | null: false                            |
| postal_code  | integer    | null: false                            |
| prefecture   | integer    | null: false  activehash                |
| city         | string     | null: false                            |
| port         | string     | null: false                            |
| building     | string     |                                        |
| tel          | integer    | null: false                            |
| user         | references | null: false, foreign_key: true         |
| item         | references | null: false, foreign_key: true         |

### Association

- belongs_to :user
- belongs_to :item