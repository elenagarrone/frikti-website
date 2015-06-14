class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true    

  def headers
    {
      :subject => "Contact form from Frikti",
      :to => ENV["EMAIL_MAILER"], 
      :from => %("#{name}" <#{email}>)
    }
  end
end