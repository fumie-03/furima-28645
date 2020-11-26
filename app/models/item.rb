class Item < ApplicationRecord
  has_one :buyer
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :send_time


  with_options presence: true do
    validates :name
    validates :explanation
    validates :price
  end

  with_options numericality: { other_than: 1, message: "Select"} do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :send_time_id
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: " Half-width number."} 
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than: 9999999, message: " Out of setting range."}

  has_one_attached :image
  validate :image_presence

  def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, " Attach the jpeg or png file")
      end
    else
      errors.add(:image, " can't be blank.")
    end
  end
end

