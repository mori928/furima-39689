# README
# テーブル設計

## users テーブル

| Column             | Type     | Options                       |
| ------------------ | ------   | ------------------------------|
| name               | string   | null: false                   |
| email              | string   | null: false, foreign_key: true|
| password           | string   | null: false                   |
| re_password        | string   | null: false                   |
| family_name        | string   | null: false                   |
| first_name         | string   | null: false                   |
| family_name_kana   | string   | null: false                   |
| first_name_kana    | string   | null: false                   |
| birthday           | date     | null: false                   |


### Association

- has_many :items
- has_many :comments

## items テーブル

| Column             | Type       | Options     |
| ------             | ------     | ----------- |
| image              | string     | null: false | 　#写真の取り扱い？
| item_name          | string     | null: false |
| item_description   | text       | null: false |
| category           | references | null: false |
| item_condition     | references | null: false |
| cost               | references | null: false |
| shipping_area      | references | null: false |
| shipping_time      | references | null: false |
| price              | integer    | null: false |
| user_id            | references | null: false |

### Association

- belongs_to : users 
- has_one :users
- has_many :comments

## comments テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| comment   | text       | null: false                    |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users

## purchases テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| card_no            | string | null: false |
| expiration         | string | null: false |
| security_code      | string | null: false |
| postal             | string | null: false |
| area               | string | null: false |
| city               | string | null: false |
| address            | string | null: false |
| building_name      | string |             |
| phone              | string | null: false |

### Association

- belongs_to :items



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
