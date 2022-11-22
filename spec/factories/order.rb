FactoryBot.define do
  factory :order, :class => Order do
    association :user
    date { Date.today }
  end
end
