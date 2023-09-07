class Item < ApplicationRecord
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  belongs_to :user 
  has_one :order   
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :shipping_time


  validates :image, presence: true
  validates :item_name, :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :cost_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_time_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}


  # sold_out 属性を許可
  attr_accessor :sold_out
  def sold_out?
    # ここに売り切れているかどうかのロジックを追加
    # 例: 在庫が0の場合に true を返す
    self.stock_quantity == 0
  end

end


