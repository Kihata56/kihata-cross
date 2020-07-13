# README

# CROSS DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: false|
|password|string|null: false|
### Association
- has_many :posts
- has_many :comments
- has_many :relationships
- has_many :profiles
- has_many :likes
- has_many :favorite

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|old|integer|null: false|
|introduction|text|null: false|
|image|string|null: true|
### Association
- belongs_to :user

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|text|text|null: false|
|picture|string|null: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many  :conditions,  through:  :posts_conditions

## posts_conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :condition

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|foreign_key: true|
|post_id|references|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## relationships
|Column|Type|Options|
|------|----|-------|
|followed_id|integer|null: false, foreign_key: true|
|follower_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## conditions
|Column|Type|Options|
|------|----|-------|
|times|time|null: false, foreign_key: true|
|place|string|null: false, foreign_key: true|
### Association
- has_many  :conditions,  through:  :posts_conditions

## Favorite
|Column|Type|Options|
|------|----|-------|
|profile_id|string|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user
