# テーブル設計

## users テーブル

| Column             | Type   | Options       | 
| ------------------ | ------ | ------------- | 
| name               | string |  null: false  | 
| email              | string |  null: false  | 
| encrypted_password | string |  null: false  | 

### Association

- has_many :posts
- has_many :comments 
- has_many :likes

## posts テーブル

| Column      | Type       | Options                        | 
| ----------- | ---------- | ------------------------------ | 
| title       | string     | null: false                    | 
| description | text       | null: false                    | 
| user        | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- has_many :comments
- has_many :likes

## comments テーブル

| Column  | Type       | Options                        | 
| ------- | ---------- | ------------------------------ | 
| comment | text       | null: false                    | 
| post    | references | null: false, foreign_key: true | 
| user    | references | null: false, foreign_key: true | 

### Associations

belongs_to :user
belongs_to :post
has_many :likes

## likes テーブル

| Column  | Type       | Options                        | 
| ------- | ---------- | ------------------------------ | 
| user    | references | null: false, foreign_key: true | 
| post    | references | null: false, foreign_key: true | 
| comment | references | null: false, foreign_key: true | 

belongs_to :user
belongs_to :post
belongs_to :comment