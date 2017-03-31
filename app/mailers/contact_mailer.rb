class ContactMailer < ApplicationMailer

  # this is in its own folder but it is a class
  default from: 'alucinare@gmail.com'

   def send_contact_email(email, message)

     @email = email
     @message = message
    #  the to: has to be the email I want to send it to and in the guide the block wasn't done properly I had to put the mail()onto the same line as the do |format|
     mail(to: 'alucinare@gmail.com', subject: 'New message from website') do |format|
         format.html { render 'contact_mailer' }
         format.text { render 'contact_mailer' }
      end
   end

end
