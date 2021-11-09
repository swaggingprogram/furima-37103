class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :fee
  belongs_to :place
  belongs_to :arrive
  belongs_to :status
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :content, presence: true
  validates :price, presence: true
  validates :user, presence: true

  validates :category_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :fee_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :place_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :arrive_id, numericality: { other_than: 1, message: "can't be blank" } 
end
