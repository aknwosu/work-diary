FactoryBot.define do
  factory :work_log do
    clock_in { Time.now.hour - 1 }
    clock_out { Time.now }
  end
end
