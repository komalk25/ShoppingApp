FactoryBot.define do
  factory :user, :class => User do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password { 'userpassword1' }
    password_confirmation { 'userpassword1' }
    name { 'komalk' }
    address { 'Hinjewadi pune' }
    pincode { 411057 }
    state { 'maharashtra' }
    phone { 123456789 }
  end
end
