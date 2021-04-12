# テーブル設計

## users テーブル

| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| email      | string | null: false, unique: true |
| password   | string | null: false               |
| name       | string | null: false               |
| name_kana  | string | null: false               |


### Association

- has_many :meetings
- has_many :minutes

## meetings テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| date        | date       | null: false       |
| time        | time       | null: false       |
| title       | string     | null: false       |
| client      | string     | null: false       |
| zoom_url    | text       |                   |
| user        | references | foreign_key: true |

### Association

- has_many :minutes
- has_many :member
- belongs_to :user

## minutes テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| minutes        | text       | null: false       |
| user           | references | foreign_key: true |
| meeting        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :meeting

## members テーブル

| Column                   | Type       | Options           |
| ------------------------ | ---------- | ----------------- |
| minutes_member_name      | string     | null: false       |
| minutes_member_name_kana | string     | null: false       |
| meeting                  | references | foreign_key: true |

### Association

- belongs_to :meeting