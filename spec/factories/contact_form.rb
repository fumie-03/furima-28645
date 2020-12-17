FactoryBot.define do
  factory :contact_form do
    user_id        {1}
    item_id        {1}
    post_code      {"123-4567"}
    prefecture_id  {3}
    city           {"山田市"}
    street_number  {"三和町1-1-1"}
    phone_number   {"09010115437"}

  end
end
