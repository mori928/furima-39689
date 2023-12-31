# README
# テーブル設計

## users テーブル

| Column             | Type     | Options                       |
| ------------------ | ------   | ------------------------------|
| nickname           | string   | null: false                   |
| email              | string   | null: false, unique: true     |
| encrypted_password | string   | null: false                   |
| family_name        | string   | null: false                   |
| first_name         | string   | null: false                   |
| family_name_kana   | string   | null: false                   |
| first_name_kana    | string   | null: false                   |
| birthday           | date     | null: false                   |


### Association

- has_many : items
- has_many : orders

## items テーブル

| Column             | Type       | Options                        |
| ------             | ------     | -----------                    |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| cost_id            | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| shipping_time_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to : user 
- has_one : order

## orders テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address
- belongs_to :user

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| postal             | string     | null: false                    |
| area_id            | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone              | string     | null: false                    |
| order_id           | references | null: false, foreign_key: true |


### Association

- belongs_to : order




This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
