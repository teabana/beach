1.タイトルと概要
タイトル：Beach
概要：ビーチ検索サイト、沖縄県内のビーチを条件によって検索できる。
    沖縄県内には、穴場も含めてたくさんのビーチがあるが駐車場や防護ネット、BBQの可不可等といった
    情報をまとめて載せているビーチサイトはないので、本サイトによって自分の求めている新しいビーチを見つけることができる。

URL：https://beach-rails.herokuapp.com/

2.使用技術
・Ruby 2.6.5
・Ruby on Rails 6.0.0
・MySQL 0.5.3
・saas 5

3.機能一覧
・ユーザ登録、ログイン機能
・ビーチ投稿
・コメント機能
・検索機能

4.テーブル設計

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
| detail             | text       | null: false                    |
| area_id            | integer    | null: false                    |
| activity_id        | integer    | null: false                    |
| facility_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

## Association

belongs_to :user
has_one    :beach_detail

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
