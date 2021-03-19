# README

## Users名

| Column       | Type     | Options        |
|--------------|----------|----------------|
| nickname     | string   | null: false    |
| email        | string   | unique: true   |
| password     | string   | null: false    |
| name         | string   | null: false    |
| name_reading | string   | null: false    |
| birthday     | integer  | null: false    |

### Association
- has_many :items
- has_many :purchases


## Items名

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| item_name        | string     | null: false       |
| image            |            | ActiveStorage     |
| text             | text       | null: false       |
| category_id      | integer    | null: false       |
| condition_id     | integer    | null: false       |
| burden_id        | integer    | null: false       |
| location_id      | integer    | null: false       |
| shipping_date_id | integer    | null: false       |
| price            | integer    | null: false       |
| user_id          | references | foreign_key: true |

### Association
- belongs_to :user
- has_one_attached :purchase


## Purchases名

| Column   | Type       | Options           |
|----------|------------|-------------------|
| user_id  | references | foreign_key: true |
| item_id  | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one_attached: address


## Address名

| Column        | Type       | Options        |
|---------------|------------|----------------|
| postal_code   | integer    | null: false    |
| prefecture_id | integer    | null:false     |
| city          | integer    | null: false    |
| house_number  | string     | null: false    |
| phone_number  | integer    | null: false    |
| purchase_id   | references | foreign_key    |


### Association
- belongs_to: purchase