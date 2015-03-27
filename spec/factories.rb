FactoryGirl.define do
  factory(:user) do
    sequence(:email) { |n| "user#{n}@domain.tld" }
    password('11111111')
    password_confirmation('11111111')
  end
  factory(:post) do
    title('Super good coffee')
    entry('Its super cool')
    date(03/21/2014)
    user_id(1)
  end
end
