FactoryBot.define do
  factory :buy_address do
    user_id   {1}
    item_id   {1}

    postal_code    {'123-4567'}
    start_id       {1}
    city           {'あああ'}
    house_number   {'あああ'}
    building_name  {'あああ'}
    tel            {'09012345678'}

    token {"tok_abcdefghijk00000000000000000"}
  end
end
