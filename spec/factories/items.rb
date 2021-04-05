FactoryBot.define do
  factory :item do
    goods_name      {'aaa'}
    explanation     {'aaa'}
    category_id     {1}
    status_id       {1}
    burden_id       {1}
    start_id        {1}
    preparation_id  {1}
    price           {500}
    # user            {1}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
