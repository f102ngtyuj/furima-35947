FactoryBot.define do
  factory :user do
    nickname              {'dokaben'}
    email                 {'kkk@gmail.com'}
    password              {'00000000'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birthday              {'7月2日'}
  end
end