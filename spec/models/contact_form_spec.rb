require 'rails_helper'

RSpec.describe ContactForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    sleep(1)
    @contact_form = FactoryBot.build(:contact_form, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'user_idとitem_id,post_code,prefecture_id,city,street_number,phone_number,tokenが存在していれば保存できること' do
        expect(@contact_form).to be_valid
      end

      it '建物番号がなくても保存できること' do
        @contact_form.building_name = nil
        expect(@contact_form).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'post_codeが空だと保存できないこと' do
        @contact_form.post_code = nil
        @contact_form.valid?
        expect(@contact_form.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @contact_form.post_code = '1234567'
        @contact_form.valid?
        expect(@contact_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'prefectureを選択していないと保存できないこと' do
        @contact_form.prefecture_id = 1
        @contact_form.valid?
        expect(@contact_form.errors.full_messages).to include("Prefecture Select")
      end

      it 'cityが空だと保存できないこと' do
        @contact_form.city = nil
        @contact_form.valid?
        expect(@contact_form.errors.full_messages).to include("City can't be blank")
      end

      it 'street_numberが空だと保存できないこと' do
        @contact_form.street_number = nil
        @contact_form.valid?
        expect(@contact_form.errors.full_messages).to include("Street number can't be blank")
      end
  
      it 'phone_numberが空だと保存できないこと' do
        @contact_form.phone_number = nil
        @contact_form.valid?
        expect(@contact_form.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it 'phone_numberが12桁以上では登録できないこと' do
        @contact_form.phone_number = '090123456789'
        @contact_form.valid?
        expect(@contact_form.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが英数混合では登録できないこと' do
        @contact_form.phone_number = '090123456nm'
        @contact_form.valid?
        expect(@contact_form.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @contact_form.token = nil
        @contact_form.valid?
        expect(@contact_form.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では購入できないこと" do
        @contact_form.user_id = nil
        @contact_form.valid?
        expect(@contact_form.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では購入できないこと" do
        @contact_form.item_id = nil
        @contact_form.valid?
        expect(@contact_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

