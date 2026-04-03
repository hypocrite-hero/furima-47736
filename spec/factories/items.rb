FactoryBot.define do
  factory :item do
    item_name { 'テスト商品' }
    item_info { 'テストの説明' }
    category_id { 2 } # ActiveHashの1以外
    item_status_id { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id { 2 }
    scheduled_delivery_id { 2 }
    item_price { 3000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
