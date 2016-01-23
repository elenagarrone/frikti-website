class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true    

  def headers
    {
      :subject => %("#{name.upcase}") + " sent you a question (www.KrisJPhotography.uk)",
      :to => ENV["EMAIL_MAILER"], 
      :from => %("#{name}" <#{email}>)
    }
  end
end