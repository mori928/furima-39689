class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal, :area_id, :address, :city, :phone, :building_name, :price, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :area_id, numericality: {other_than: 1 }
    validates :city
    validates :address
    validates :phone, format: {with: /\A\d{10,11}\z/}
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal: postal, area_id: area_id, city: city, address: address, phone: phone, building_name: building_name, order_id: order.id)
  end
end

#住所の番地の設定が必要　
# IDの扱い方


