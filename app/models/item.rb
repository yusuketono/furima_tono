class Item < ApplicationRecord
  # アソシエーション 

  # 画像投稿
  has_one_attached :image

  # active hash関連
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  # バリデーション

end
