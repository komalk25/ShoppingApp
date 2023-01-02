task weekly_update: :environment do
  @seller = Seller.all
  @report = OrderItem.joins(product: :seller).all.group(:email).count
  @seller.each do |s|
    @report.each do |key,value|   

      if s.email == key                
        OrderMailer.weekly_mail(s.email,value).deliver_now  
      end
    end   
  end
end