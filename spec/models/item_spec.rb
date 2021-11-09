require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品の出品" do
    context "商品の出品ができる場合" do
      it "必要な項目を全て入力すると商品の出品が可能になる" do
        expect(@item).to be_valid
      end
    end
    context "商品の出品ができない場合" do
      it "商品名がないと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "説明がないと出品できない" do
        @item.content = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it "カテゴリーがないと出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態がないと出品できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "配送料の負担がないと出品できない" do
        @item.fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it "発送元の地域がないと出品できない" do
        @item.place_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Place can't be blank")
      end
      it "発送までの日数がないと出品できない" do
        @item.arrive_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Arrive can't be blank")
      end
      it "販売価格がないと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が300円以下だと出品できない" do
        @item.price = "11"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が9999999円以上だと出品できない" do
        @item.price = "100000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "販売価格に数値以外が入力されると出品できない" do
        @item.price = "abcd"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "ユーザーに紐づいてないと出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
