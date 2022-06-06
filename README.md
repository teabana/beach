テーブル設計

## usersテーブル

| Column                 | Type    | Options                      |
| ---------------------- | ------- | ---------------------------- |
| email                  | string  | null: false, unique: true    |
| encrypted_password     | string  | null: false                  |
| nickname               | string  | null: false                  |
| admin                  | boolean | null: false, default: false  |

## Association

has_many :posts
has_many :comments
has_many :favorites

## postsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| image          | text       | null: false                    |
| text           | text       |                                |
| user           | references | null: false, foreign_key: true |
| beach          | references | null: false, foreign_key: true |

## Association

belongs_to :user
belongs_to :beach
has_many :comments

## commentsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| comment        | text       | null: false                    |
| user           | references | null: false, foreign_key: true |
| post           | references | null: false, foreign_key: true |

## Association

belongs_to :user
belongs_to :post

## favoritesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| beach          | references | null: false, foreign_key: true |

## Association

belongs_to :user
belongs_to :beach

## beachテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| beach              | string     | null: false                    |
| parking_id         | integer    | null: false                    |
| shower_id          | integer    | null: false                    |
| protection_net_id  | integer    | null: false                    |
| life_saver_id      | integer    | null: false                    |
| toilet_id          | integer    | null: false                    |
| snorkeling_id      | integer    | null: false                    |
| surfing_id         | integer    | null: false                    |
| bonfire_id         | integer    | null: false                    |
| bbq_id             | integer    | null: false                    |
| alcohol_id         | integer    | null: false                    |

## Association

bas_one :post
has_one :beach_detail

## beach_detailsテーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| beach            | references | null: false, foreign_key: true |
| parking_fee      | integer    | null: false                    |
| parking_number   | integer    | null: false                    |
| shower_fee       | integer    | null: false                    |
| toilet           | string     | null: false                    |
| bonfire          | string     | null: false                    |
| bbq              | string     | null: false                    |
| super            | string     | null: false                    |

## Association

belongs_to  :beach 