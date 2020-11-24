class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: "is invalid. Include both letters and numbers." 
         validates_format_of :password, without: /\A[０-９ａ-ｚＡ-Ｚ]+\z/i, message:"is invalid.Input half-width characters."

    with_options presence: true do
      validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
      validates :birth_date

      NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
      with_options format: { with: NAME_REGEX, message: "is invalid. Input full-width characters."} do
        validates :last_name 
        validates :first_name
      end

      KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
      with_options format: { with: KANA_REGEX, message: "is invalid. Input full-width katakana characters."} do
        validates :last_name_kana
        validates :first_name_kana
      end
    end
end
