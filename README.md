##テーブル設計

  usersテーブル
|Column           |Type     |Options      |
|-----------------|---------|-------------|
| email           | string  | unique: true |
| encrypted_password        | string  | null: false , null: false|
| nick_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_rubi | string  | null: false |
| last_name_rubi  | string  | null: false |
| birthday        | date | null: false |


  Association
  has_many : items
  has_many : buys

  itemsテーブル
|Column        |Type     |Options      |
|--------------|---------|-------------|
| goods_name     | string  | null: false |
| explanation  | text    | null: false |
| category_id    | integer  | null: false |
| status_id      | integer  | null: false |
| burden_id      | integer  | null: false |
| start_id       | integer  | null: false |
| preparation_id | integer | null: false |
| price        | integer | null: false |
| user         | references | foreign_key: true |

  Association
  belongs_to : user
  has_one : buy

  buysテーブル
|Column       |Type     |Options      |
|-------------|---------|-------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

  Association
  belongs_to : user
  belongs_to : item
  has_one : address

  addressテーブル
|Column         |Type     |Options      |
|---------------|---------|-------------|
| postal_code   | string | null: false |
| start_id    | integer  | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building_name | string  |             |
| tel           | string  | null: false |
| buy           | references | foreign_key: true |

  Association
  belongs_to : buy
