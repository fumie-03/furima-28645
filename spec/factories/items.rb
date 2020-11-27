FactoryBot.define do
  factory :item do
    name         {"neko"}
    explanation  {"aaaaaaa"}
    price        {333}
    category_id    {3}
    condition_id   {3}
    postage_id     {3}
    prefecture_id  {3}
    send_time_id   {3}
    user_id        {1}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
