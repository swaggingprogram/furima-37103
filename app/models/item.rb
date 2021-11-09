class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :fee
  belongs_to :place
  belongs_to :ship_date
  belongs_to :status
  belongs_to :user

  validates :name, presence: true
  validates :content, presence: true
  validates :price, presence: true
  validates :user, presence: true, foreign_key: true

  validates :category_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :fee_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :place_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :ship_date_id, numericality: { other_than: 1, message: "can't be blank" } 
end
