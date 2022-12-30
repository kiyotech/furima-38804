# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_year         | integer | null: false               |
| birth_month        | integer | null: false               |
| birth_date         | integer | null: false               |

### Association   

- has_many :items
- has_many :orders
- has_many :order_users

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_image          | text       | null: false                    |
| item_name           | string     | null: false                    |
| info                | text       | null: false                    |
| category            | string     | null: false                    |
| sales_status        | string     | null: false                    |
| shipping_fee_status | string     | null: false                    |
| prefecture          | string     | null: false                    |
| scheduled_delivery  | string     | null: false                    |
| price               | integer    | null: false                    |
| nickname            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :orders

## orders テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_image          | references | null: false  foreign_key: true |
| item_name           | references | null: false, foreign_key: true |
| shipping_fee_status | references | null: false, foreign_key: true |
| price               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_many :users
- has_one :shipping
- has_many :order_users

## shippings テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| postal_code         | integer    | null: false |
| shipping_prefecture | references | null: false |
| city                | string     | null: false |
| addresses           | string     | null: false |
| building            | string     | null: false |
| phone_number        | integer    | null: false |

### Association

- belongs_to :order

## order_users テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| order_id | references | null: false, foreign_key: true |
| user_id  | references | null: false, foreign_key: true |
### Association

- belongs_to :order
- belongs_to :user
