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

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| name            | string     | null: false       |
| menu            | string     | null: false       |
| set_count_id    | integer    | null: false       |
| rest_id         | integer    | null: false       |
| user_id         | references | foreign_key: true |
| workout_time_id | integer    | null: false       |
| having_user_id  | references | foreign_key: true |
| status_id       | integer    | null: false       |

### Association

- belongs_to :user
- has_many :next_routines
- has_many :workouts

## next_routinesテーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| menu            | string     | null: false       |
| set_count_id    | integer    | null: false       |
| rest _id        | integer    | null: false       |
| routine_id      | references | foreign_key: true |
| workout_time_id | integer    | null: false       |


### Association

- belongs_to :routine

## workoutsテーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| workout_date | date       | null: false       |
| user_id      | references | foreign_key: true |
| routine_id   | references | foreign_key: true |
| routine_name | string     | null: false       |


### Association

- belongs_to :user
- belongs_to :routine

## workoutsテーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| user_id      | references | foreign_key: true |
| routine_id   | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :routine