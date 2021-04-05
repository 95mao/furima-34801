class Burden < ActiveHash::Base  # ActiveHash::Base はActiveHashを利用するモデルクラスって意味
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '着払い（購入者負担）' },
    { id: 2, name: '送料込み（出品者負担）' }
  ]

  include ActiveHash::Associations  # ActiveHash で has_many を書くときに記述するもの
  has_many :items
end