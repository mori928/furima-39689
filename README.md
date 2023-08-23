# README
# テーブル設計

## users テーブル

| Column             | Type     | Options                       |
| ------------------ | ------   | ------------------------------|
| name               | string   | null: false                   |
| email              | string   | null: false, unique: true     |
| encrypted_password | string   | null: false                   |
| family_name        | string   | null: false                   |
| first_name         | string   | null: false                   |
| family_name_kana   | string   | null: false                   |
| first_name_kana    | string   | null: false                   |
| birthday           | date     | null: false                   |


### Association

- has_many :items

## items テーブル

| Column             | Type       | Options                        |
| ------             | ------     | -----------                    |
| item_name          | string     | null: false                    |
| item_description   | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| cost_id            | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| shipping_time_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to : users 
- has_one : purchase_records

## purchase_records テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- has_one : items
- has_one : shipping_info

## shipping_infos テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| postal             | string     | null: false                    |
| area               | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone              | string     | null: false                    |
| purchase_record    | references | null: false, foreign_key: true |


### Association

- has_one : purchase_record



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
