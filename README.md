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

- has_one :minute
- belongs_to :user

## minutes テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| member         | text       | null: false       |
| minutes        | text       | null: false       |
| user           | references | foreign_key: true |
| meeting        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :meeting
