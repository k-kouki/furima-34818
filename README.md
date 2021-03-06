# README

## Usersテーブル

| Column              | Type     | Options                   |
|---------------------|----------|---------------------------|
| nickname            | string   | null: false               |
| email               | string   | unique: true, null: false |
| encrypted_password  | string   | null: false               |
| first_name          | string   | null: false               |
| last_name           | string   | null: false               |
| first_name_reading  | string   | null: false               |
| last_name_reading   | string   | null: false               |
| birthday            | date     | null: false               |

### Association
- has_many :items
- has_many :purchases


## Itemsテーブル

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| name             | string     | null: false       |
| text             | text       | null: false       |
| category_id      | integer    | null: false       |
| condition_id     | integer    | null: false       |
| burden_id        | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| shipping_date_id | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## Purchasesテーブル

| Column   | Type       | Options           |
|----------|------------|-------------------|
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one: address


## Addressesテーブル

| Column        | Type       | Options            |
|---------------|------------|--------------------|
| postal_code   | string     | null: false        |
| prefecture_id | integer    | null:false         |
| city          | string     | null: false        |
| house_number  | string     | null: false        |
| building_name | string     |                    |
| phone_number  | string     | null: false        |
| purchase      | references | foreign_key: true  |


### Association
- belongs_to: purchase