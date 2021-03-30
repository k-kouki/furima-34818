class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :house_number
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :postal_code, format: {with:/\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
  validates :prefecture_id, numericality: {other_than: 0, message: "Select"}
  validates :phone_number, format:{with:/\A\d{11}\z/, message:"Input only number"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end