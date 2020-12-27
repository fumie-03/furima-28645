class ContactForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number, :token

  # ここにバリデーションの処理を書く
  validates :prefecture_id, numericality: { other_than: 1, message: "Select"}
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :street_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end