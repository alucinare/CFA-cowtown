class ContactController < ApplicationController
  # this is cool, it will skip the before_action that is in the applications controller
  skip_before_action :authenticate_user!

  def index
  end

  def mail

    # this checks if the contact params have been filled in and if so it'll continue and take the email and message out of the contact object
    if params[:contact]
      email =  params[:contact][:email]
      message = params[:contact][:message]

      # if the email was sent or the message was present this will
      if email.present? || message.present?
        # Tell the UserMailer to send a welcome email after save
        ContactMailer.send_contact_email(email, message).deliver_now
        redirect_to '/contact', notice: 'Email sent!'
      else
        flash[:warning] = "Please fill out the form"
        redirect_to '/contact'
      end
    end

    @contact = params[:contact]

    puts @contact.inspect


  end

end
