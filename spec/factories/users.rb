FactoryBot.define do
  factory :user do
    username { 'tester404' }
    email { 'tester404@tester.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
