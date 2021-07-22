# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birthday           | date   | null: false |


### Association

- has_many :routines
- has_many :workouts

## routinesテーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| menu    | string     | null: false       |
| set     | integer    | null: false       |
| rest    | integer    | null: false       |
| user_id | references | foreign_key: true |


### Association

- belongs_to :user
- has_many :next_routines
- has_many :workouts

## next_routinesテーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| menu       | string     | null: false       |
| set        | integer    | null: false       |
| rest       | integer    | null: false       |
| routine_id | references | foreign_key: true |


### Association

- belongs_to :routine

## workoutsテーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| workout_date | date       | null: false       |
| user_id      | references | foreign_key: true |
| routine_id   | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :routine