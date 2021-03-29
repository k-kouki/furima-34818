FactoryBot.define do
  factory :purchase_address do
    postal_code        {'636-0202'}
    prefecture_id      {2}
    city               {'磯城郡川西町'}
    house_number       {'1390'}
    building_name      {'潰れ荘'}
    phone_number       {'08057020954'}
    # association :purchase
  end
end
