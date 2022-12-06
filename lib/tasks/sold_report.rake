task sold_report: :environment
    Seller.find_each do |seller|
    OrderMailer.weekly_mail(seller).deliver
    end   
end