class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :image, presence: true
  with_options presence: true do
    validates :item_name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
  end
  with_options numericality: { other_than: 1, message: "を入力してください" } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
  validates :price, presence: true
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300円から9,999,999円の範囲で入力してください' }
  validates :price, numericality: { only_integer: true, message: 'は半角数字で入力してください' }
end
