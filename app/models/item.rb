class Item < ApplicationRecord
  has_one :buyer
  belongs_to :user
  # belongs_to_active_hash :category
  # belongs_to_active_hash :condition
  # belongs_to_active_hash :postage
  # belongs_to_active_hash :prefecture
  # belongs_to_active_hash :send_time
end
