FactoryBot.define do
  factory :user do
    nick_name              {'test'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'あああ'}
    last_name             {'いいい'}
    first_name_rubi       {'アアア'}
    last_name_rubi        {'イイイ'}
    birthday              {'20210401'}
  end
end