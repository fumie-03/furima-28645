FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password                        {"000abc"}
    # password_confirmation           {"000abc"}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_date            {"2020-01-01"}
  end
end