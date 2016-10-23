class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contacts_params)
    @contact.request = request
    if @contact.deliver
      flash[:notice] = "Thanks for your message. I'll get back to you as soon as possible."
      redirect_to root_url
    else
      flash[:notice] = "Oops, something went wrong. Please try again."
      redirect_to :new
    end
  end

  def contacts_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
