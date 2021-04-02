FactoryBot.define do
  factory :user do
    nick_name              {'test'}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 4) } # 数字と英字を確実に混合させる書き方
    password_confirmation {password}
    first_name            {'あああ'}
    last_name             {'いいい'}
    first_name_rubi       {'アアア'}
    last_name_rubi        {'イイイ'}
    birthday              {'20210401'}
  end
end