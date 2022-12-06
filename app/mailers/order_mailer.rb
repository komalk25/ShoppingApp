class OrderMailer < ApplicationMailer
    
    def order_confirm(user)
        @user = user
        mail to: @user.email, subject: "OrderConfirm"
    end    

    def weekly_mail(s,report)
        @report = report
        mail to: s, subject: "product report"
    end    
 
end
