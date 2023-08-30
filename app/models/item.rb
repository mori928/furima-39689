class Item < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :item_name, :description, presence: true
  validates :cotegory_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :cost_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_time_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  
  # belongs_to : user     
  # has_one : order
  has_one_attached :image
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :shipping_time

  
end
