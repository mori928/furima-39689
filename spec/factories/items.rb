FactoryBot.define do
  factory :item do
    item_name       { Faker::Internet.password(max_length: 40) } 
    description     { Faker::Internet.password(max_length: 1000) }
    price           { Faker::Number.within(range: 300..9999999) }  # 300〜9,999,999のランダムな価格
    # fee_percentage  { 10 }  # 販売手数料率（10%と仮定）
  
    # after(:build) do |item|
    #   item.fee = (item.price * item.fee_percentage / 100).floor  # 小数点以下を切り捨てて販売手数料を計算
    # end
  end
end
