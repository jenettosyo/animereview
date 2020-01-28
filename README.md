# README

### usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|encrypted_password|string|null: false|
|name|string|null: false|
|iamge|string||


### Association
- has_many :comments
- has_many :tweets



### tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|picture|string|null: false|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- has_many :comments




### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|


### Association
- has_many :comments
- has_many :tweets




### likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|