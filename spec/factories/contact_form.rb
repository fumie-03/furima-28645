FactoryBot.define do
  factory :contact_form do
    post_code      {"123-4567"}
    prefecture_id  {3}
    city           {"山田市"}
    street_number  {"三和町1-1-1"}
    building_name  {"猫ビル"}
    phone_number   {"09010115437"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
