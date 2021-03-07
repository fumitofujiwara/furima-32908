# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| nickname             | string  | null: false |
| email                | string  | null: false |
| password             | string  | null: false | 
| last_name            | string  | null: false |
| First_name           | string  | null: false |
| last_name_furigana   | string  | null: false | 
| first_name_furigana  | string  | null: false |
| birthday_year        | integer | null: false |
| birthday_month       | integer | null: false |
| birthday_day         | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column          | Type          | Options                        |
| --------------- | --------------| -------------------------------|
| name            | string        | null: false                    |
| description     | text          | null: false                    |#説明
| category        | string        | null: false                    |
| status          | string        | null: false                    |#状態
| delivery_fee    | string        | null: false                    |#配送料の負担額
| delivery_area   | string        | null: false                    |#配送元地域
| delivery_date   | string        | null: false                    |#配送日数
| selling_price   | integer       | null: false                    |#販売価格
| user            | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ | 
| card_information   | integer    | null: false                    |#カード情報
| expiration_month   | integer    | null: false                    |#有効期限月
| expiration_year    | integer    | null:false                     |#有効期限年
| security_code      | integer    | null: false                    |#セキュリティーコード
| postal_code        | string     | null: false                    |#郵便番号
| prefecture         | string     | null: false                    |#都道府県
| municipal_district | string     | null: false                    |#市町村区
| address            | string     | null: false                    |#番地
| building_name      | string     |                                |
| phone_number       | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
