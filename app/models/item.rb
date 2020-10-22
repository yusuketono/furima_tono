class Item < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_one :item_transaction

  # 画像投稿
  has_one_attached :image

  # active hash関連
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  # <<バリデーション>>
  #「---」
  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  # presence: true
  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price
  end

   # 金額が半角であるか検証
   validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }

   # 金額の範囲
   validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'

end