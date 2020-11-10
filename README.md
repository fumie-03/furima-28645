# テーブル設計

## users テーブル

| Column          | Type   | Options                      |
| --------------- | ------ | ---------------------------- |
| nickname        | string | null: false                  |
| email           | string | null: false, unique:true     |
| password        | string | null: false                  |
| last_name       | string | null: false                  |
| first_name      | string | null: false                  |
| last_name_kana  | string | null: false                  |
| first_name_kana | string | null: false                  |
| birth_date      | date   | null: false                  |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| explanation    | text       | null: false                    |
| user           | references | null: false, foreign_key: true |
| images_id      | integer    | null: false                    |
| category_id    | integer    | null: false                    |
| condiotion_id  | integer    | null: false                    |
| postage_id     | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| send_time_id   | integer    | null: false                    |
| price          | integer    | null: false                    |
| service_charge | integer    | null: false                    |
| profit_on_sale | integer    | null: false                    |

### Association

- has_one :buyer
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :send_time


## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_one : address
- belongs_to :user
- belongs_to :item


## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | integer    | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false, unique: true      |
| buyer          | references | null: false, foreign_key: true |

### Association

- belongs_to_active_hash : prefecture
- belongs_to :buyer

