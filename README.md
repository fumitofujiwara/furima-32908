# テーブル設計

## users テーブル

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               | 
| last_name            | string  | null: false               |
| first_name           | string  | null: false               |
| last_name_furigana   | string  | null: false               |
| first_name_furigana  | string  | null: false               |
| birthday             | date    | null: false               |


### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column           | Type          | Options                        |
| ---------------  | --------------| -------------------------------|
| name             | string        | null: false                    |
| description      | text          | null: false                    |#説明
| category_id      | integer       | null: false                    |
| status_id        | integer       | null: false                    |#状態
| delivery_fee_id  | integer       | null: false                    |#配送料の負担額
| delivery_area_id | integer       | null: false                    |#配送元地域(都道府県)
| delivery_date_id | integer       | null: false                    |#配送日数
| selling_price    | integer       | null: false                    |#販売価格
| user             | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :comments

## comments テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ | 
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ | 
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliveries テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ | 
| postal_code        | string     | null: false                    |#郵便番号
| delivery_area_id   | integer    | null: false                    |#都道府県(配送元地域)
| municipal_district | string     | null: false                    |#市町村区
| address            | string     | null: false                    |#番地
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |


### Association

- belongs_to :order
