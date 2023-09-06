FactoryBot.define do
  factory :order_address do
    postal        { '123-4567' }
    area_id       { 2 }
    city          { '東京都' }
    address       { '1-1' }
    building_name { '東京ハイツ' }
    price         { 2000 }
    phone         { "/\A\d{10,11}\z/" }
  end
end