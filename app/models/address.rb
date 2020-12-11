class Address < ApplicationRecord
  belongs_to :buyer
  belongs_to_active_hash :prefecture
end
