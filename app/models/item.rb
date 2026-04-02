class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true

  validates :category_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :item_status_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :shipping_fee_status_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :scheduled_delivery_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :item_price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "can't be blank"}


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

end
