FactoryBot.define do
  factory :item do
 
    category_id      { Faker::Number.between(from: 2, to: 10) }
    condition_id     { Faker::Number.between(from: 2, to: 7) }
    cost_id          { Faker::Number.between(from: 2, to: 3) }
    area_id          { Faker::Number.between(from: 2, to: 48) }
    shipping_time_id { Faker::Number.between(from: 2, to: 4) }
    price            { Faker::Number.within(range: 300..9999999) }  # 300〜9,999,999のランダムな価格
    item_name        { "商品名" }
    description      { "商品の説明文" }
    association :user 

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end