class Seller < ApplicationRecord
  has_many :products

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.weekly_update
    @seller = Seller.all
    @report = OrderItem.joins(product: :seller).all.group(:name).count
    @seller.each do |s|
      @report.each do |key,value|
        if s.email == key
          OrderMailer.weekly_mail(s.email,value).deliver_now  
        end
      end
    end
  end
end
