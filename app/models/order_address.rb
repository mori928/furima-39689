class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :price, :user_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "can't be blank"} 
    validates :phone, presence: true, format: { with: /^0\d{1,4}-\d{1,4}-\d{3,4}$/, message: "can't be blank" }
  end
  
  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(item: item, user: user)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postal: postal, area_id: area_id, city: city, address: address, phone: phone, building_name: building_name, order: order.id)
  end
end

#住所の番地の設定が必要　
# IDの扱い方


  
