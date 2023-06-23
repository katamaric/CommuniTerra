class OrderMailer < ApplicationMailer
  default from: 'contact@communiterra.fr'

  def order_confirmation(user, order)
    @user = user
    @order = order
    @url  = 'https://www.communiterra.com/'
    
    mail(to: @order.user.email, subject: "Confirmation de commande")
  end
end
