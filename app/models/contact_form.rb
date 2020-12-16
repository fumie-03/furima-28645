class ContactForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number

  # ここにバリデーションの処理を書く
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :street_number, presence: true
  validates :phone_number, numericality: {only_integer: true}

  def save
    # 各テーブルにデータを保存する処理を書く
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end