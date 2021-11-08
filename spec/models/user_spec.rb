require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できる場合" do
      it "ニックネーム、漢字の名前、カナの名前、誕生日、メアド、パスワードを入力すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context "新規登録できない場合" do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "kanji_lastが空では登録できない" do
        @user.kanji_last = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji last can't be blank")
      end
      it "kanji_firstが空では登録できない" do
        @user.kanji_first = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first can't be blank")
      end
      it "kanji_lastが漢字じゃないと登録できない" do
        @user.kanji_last = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji last is invalid")
      end
      it "kanji_firstが漢字じゃないと登録できない" do
        @user.kanji_first = Faker::Name.first_name
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first is invalid")
      end
      it "kana_lastが空では登録できない" do
        @user.kana_last = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last can't be blank", "Kana last is invalid")
      end
      it "kana_firstが空では登録できない" do
        @user.kana_first = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first can't be blank", "Kana first is invalid")
      end
      it "kana_lastがカタカナじゃないと登録できない" do
        @user.kana_last = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last is invalid")
      end
      it "kana_firstがカタカナじゃないと登録できない" do
        @user.kana_first = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first is invalid")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@がないと登録できない" do
        @user.email = Faker::Name.name
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが6文字未満では登録できない" do
        @user.password = "aa111"
        @user.password_confirmation = "aa111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordとpassword_confirmationが一致しないと登録できない" do
        @user.password = "aaa456"
        @user.password_confirmation = "aaa4567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが英数混合じゃないと登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "birthが空では登録できない" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
