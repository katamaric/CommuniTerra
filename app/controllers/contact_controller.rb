class ContactController < ApplicationController
  def index
  end

  def create
    email = params[:email]
    subject = params[:subject]
    message = params[:message]

    ContactMailer.contact_email(email, subject, message).deliver_now

    redirect_to root_path, notice: 'L\'email a été envoyé avec succès.'
  end
end