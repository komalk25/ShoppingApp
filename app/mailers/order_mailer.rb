class OrderMailer < ApplicationMailer
    
    def order_confirm(user)
        @user = user
        mail to: @user.email, subject: "OrderConfirm"
    end    

    def weekly_mail(s,value)
        @report = value
        @s = s
        mail to: s, subject: "product report"
    end    
 
end
