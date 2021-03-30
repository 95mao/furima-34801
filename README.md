##テーブル設計

  usersテーブル
|Column           |Type     |Options      |
|-----------------|---------|-------------|
| email           | string  | unique: true |
| password        | string  | null: false |
| nick_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_rubi | string  | null: false |
| last_name_rubi  | string  | null: false |
| year            | integer | null: false |
| month           | integer | null: false |
| day             | integer | null: false |

  Association
  has_many : itemsテーブル
  has_many : buyテーブル

  itemsテーブル
|Column        |Type     |Options      |
|--------------|---------|-------------|
| goods        | string  | null: false |
| explanation  | text    | null: false |
| category     | string  | null: false |
| status       | string  | null: false |
| burden       | string  | null: false |
| start        | string  | null: false |
| Preparation  | integer | null: false |
| price        | integer | null: false |
| user         | references | foreign_key: true |

  Association
  belongs_to : usersテーブル
  belongs_to : duyテーブル

  buyテーブル
|Column       |Type     |Options      |
|-------------|---------|-------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

  Association
  belongs_to : usersテーブル
  has_one : itemsテーブル
  belongs_to : buyテーブル

  addressテーブル
|Column         |Type     |Options      |
|---------------|---------|-------------|
| postal_code   | integer | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building_name | string  | null: false |
| tel           | string  | null: false |
| buy           | references | foreign_key: true |

  Association
  has_one : buyテーブル
