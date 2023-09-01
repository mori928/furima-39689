FactoryBot.define do
  factory :item do
    item_name        { Faker::Lorem.word[0..39] } 
    description      { Faker::Lorem.sentence }
    category_id      { Faker::Number.between(from: 1, to: 10) }
    condition_id     { Faker::Number.between(from: 1, to: 7) }
    cost_id          { Faker::Number.between(from: 1, to: 3) }
    area_id          { Faker::Number.between(from: 1, to: 48) }
    shipping_time_id { Faker::Number.between(from: 1, to: 4) }
    price            { Faker::Number.within(range: 300..9999999) }  # 300〜9,999,999のランダムな価格
    
  

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end