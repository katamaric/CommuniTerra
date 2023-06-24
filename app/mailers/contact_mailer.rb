class ContactMailer < ActionMailer::Base
  default to: "contact@communiterra.fr"

  def contact_email(email, subject, message)
    @contact_email = email
    @contact_subject = subject
    @contact_message = message

    mail(to: "contact@communiterra.fr", subject: subject)
  end
end
