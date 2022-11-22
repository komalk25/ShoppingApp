FactoryBot.define do
  factory :cart, :class => Cart do
    association :user
  end
end
