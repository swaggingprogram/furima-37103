class RecordOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :port, :building, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :port
    validates :tel, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    record = Record.create(user_id: user_id, item_id: item_id)

    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, port: port, tel: tel, building: building,
                 record_id: record.id)
  end
end
