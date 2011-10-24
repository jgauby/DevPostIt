class PostIt < ActiveRecord::Base
  has_one :language
  
  after_validation :initialize_token, :on => :create
  
  
  
  protected

  def initialize_token
    self.token = Digest::MD5.new.hexdigest(Time.now.to_i.to_s + SecureRandom.random_bytes(512) + Settings.salt_token)
  end
  
end
