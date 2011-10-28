class PersonMailer < ActionMailer::Base
  default :from => Settings.sender_mail

  include Rails.application.routes.url_helpers
  default_url_options[:host] = Settings.host
    
  def new_post_it(post_it)
    @post_it = post_it
    mail(:to => @post_it.email,
         :subject => "Votre post-it est en ligne")
  end

end
