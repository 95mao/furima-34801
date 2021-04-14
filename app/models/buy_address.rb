class BuyAddress
  # クラスにActiveModel::Modelをincludeすると、ヘルパーメソッドの引数として扱え、バリデーションの機能も使用できるようになる
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :start_id, :city, :house_number, :building_name, :tel, :token  # 保存したいカラム名を指定

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :start_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :tel, length: { maximum: 11 }, format: {with: /\A[0-9]+\z/}  # /\A[0-9]+\z/の＋は２回以上の繰り返しって意味
    # validates :tel, format: {with: /\A[0-9]{11}\z/}  0~9の11桁って記述、こちらでも大丈夫だった

    validates :token
  end


  def save  # テーブルの振分け
    buy = Buy.create(user_id: user_id, item_id: item_id)  # buy を作ったのはAddressとの繋がりのための外部キーになる  ちな、左がカラム名で右が保存する内容              ↓ buyの中の何が欲しいか考える
    Address.create(postal_code: postal_code, start_id: start_id, city: city, house_number: house_number, building_name: building_name, tel: tel, buy_id: buy.id)
  end
end

