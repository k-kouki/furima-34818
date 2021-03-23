FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'岸田'}
    last_name             {'航希'}
    first_name_reading    {'キシダ'}
    last_name_reading     {'コウキ'}
    birthday              {'1997-05-04'}
  end
end