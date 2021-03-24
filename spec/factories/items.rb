FactoryBot.define do
  factory :item do
    name              {Faker::Name.initials(number: 2)}
    text              {Faker::Lorem.sentence}
    category_id       {2}
    condition_id      {2}
    burden_id         {2}
    prefecture_id     {3}
    shipping_date_id  {1}
    price             {3000}
    association :user 

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/glasses.jpg'), filename: 'glasses.jpg')
    end
  end
end