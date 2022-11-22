FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end
FactoryBot.define do
  factory :seller, :class => 'Seller' do
    email
    password { 'person1' }
    password_confirmation { 'person1' }
  end
end
