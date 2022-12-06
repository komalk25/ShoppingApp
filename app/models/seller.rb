class Seller < ApplicationRecord
  has_many :products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def self.weekly_update
          @seller = Seller.all
          @report = OrderItem.joins(product: :seller).all.group(:name).count
           @seller.each do |s|
             OrderMailer.weekly_mail(s.email,@report).deliver_now
           end
         end  
end
