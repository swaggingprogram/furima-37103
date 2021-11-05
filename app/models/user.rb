class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :kanji_last, presence: true
  validates :kanji_first, presence: true
  validates :kana_last, presence: true
  validates :kana_first, presence: true
  validates :birth, presence: true
end
