# テーブル設計

## users テーブル

| Column             | Type   | Options                      |
| ------------------ | ------ | -----------                  |
| nickname           | string | null: false                  |
| kanji_last         | string | null: false                  |
| kanji_first        | string | null: false                  |
| kana_last          | string | null: false                  |
| kana_first         | string | null: false                  |
| birth              | date   | null: false                  |
| email              | string | null: false unique:true      |
| encrypted_password | string | null: false                  |


### Association

- has_many :items
- has_many :records

## items テーブル
  
| Column             | Type       | Options                          |
| ------             | ------     | -----------                      |
| name               | string     | null: false                      |
| content            | text       | null: false                      |
| category_id        | integer    | null: false                      |
| status_id          | integer    | null: false                      |
| fee_id             | integer    | null: false                      |
| place_id           | integer    | null: false                      |
| arrive_id       | integer    | null: false                      |
| price              | integer    | null: false                      |
| user               | references | null: false, foreign_key: true   |                   
  
### Association

- belongs_to :user
- has_one :record

## records テーブル

| user         | references | null: false, foreign_key: true         |
| item         | references | null: false, foreign_key: true         |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :order

## orders テーブル

| Column       | Type       | Options                                |
| -------      | ---------- | ------------------------------         |
| postal_code  | string     | null: false                            |
| prefecture_id| integer    | null: false                            |
| city         | string     | null: false                            |
| port         | string     | null: false                            |
| building     | string     |                                        |
| tel          | string     | null: false                            |
| record       | references | null: false foreign_key: true          |

### Association

- belongs_to :record



