class PostIt < ActiveRecord::Base
  after_validation :initialize_token, :on => :create
 
  attr_protected :token
  
  validates_format_of :email, :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i, :presence => true
  validates :title, :content, :username, :presence => true
  
  self.per_page = Settings.nb_post_its_per_page
  
  def self.last_updated
    PostIt.order('updated_at DESC, id DESC').limit(1).first
  end
  
  protected

  def initialize_token
    self.token = Digest::MD5.new.hexdigest(Time.now.to_i.to_s + SecureRandom.random_bytes(512) + Settings.salt_token)
  end
  
end
