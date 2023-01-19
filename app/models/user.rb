class User < ApplicationRecord
 
  has_one :cart
  has_many :order
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
