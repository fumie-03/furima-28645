class クラス名
  include ActiveModel::Model
  attr_accessor : user_id, item_id, post_code, prefecture_id, city, street_number, building_name, phone_number, buyer

  # ここにバリデーションの処理を書く
  validates :user_id, presence: true
  validates :item__id, presence: true
  validates :post_code, numericality: {only_integer: true}
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :street_number, presence: true
  validates :building_name, allow_blank: true
  validates :phone_number, numericality: {only_integer: true}
  validates :buyer, presence: true

  def save
    # 各テーブルにデータを保存する処理を書く
    Buyer.create(user_id: user_id, item__id: item__id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, phone_number: phone_number, buyer:buyer)
  end
end