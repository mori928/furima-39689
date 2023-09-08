FactoryBot.define do
  factory :order_address do
    postal        { '123-4567' }
    area_id       { 2 }
    city          { '東京都' }
    address       { '1-1' }
    building_name { '東京ハイツ' }
    phone         { "09090909090" }
    token         {"tok_abcdefghijk00000000000000000"}
    user_id       { 1 }
    item_id       { 2 }
  end
end