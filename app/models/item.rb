class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :status_id
      validates :burden_id
      validates :start_id
      validates :preparation_id
    end
    validates :image
    validates :goods_name
    validates :explanation
    validates :price, numericality: {greater_than: 299,less_than: 10000000}
  end

  extend ActiveHash::Associations::ActiveRecordExtensions  # ActiveHash で belongs_to を書くときに記述するもの
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :start
  belongs_to :preparation
end
