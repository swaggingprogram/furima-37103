class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :kanji_last, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "名字は漢字で入力してください"}
  validates :kanji_first, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "名前は漢字で入力してください"}
  validates :kana_last, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい" }
  validates :kana_first, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "カタカナで入力してください"}
  validates :birth, presence: true

  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "パスワードは英数混合で入力してください"}
  validates :password_confirmation, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message:  "パスワードは英数混合で入力してください"}
end
