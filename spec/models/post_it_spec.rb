require 'spec_helper'

describe PostIt do
  before :each do
    Time.stub(:now) { Time.at(200) }
    @post_it = Fabricate(:post_it)
  end
  
  describe "token " do
    it "must be initialized" do
      @post_it.token.blank?.should be_false
    end
    
    it "no change on update" do
      token = @post_it.token
      @post_it.update_attribute :title, 'a new title'
      @post_it.token.should == token
    end
  end
  
  it "last_updated return the last updated post-it" do
    Time.stub(:now) { Time.at(400) }
    last = Fabricate(:post_it)
    PostIt.last_updated.should == last
    @post_it.update_attribute :updated_at, Time.at(600)
    PostIt.last_updated.should == @post_it
  end
  
  describe "allow_modification? " do
    it "return false if token is blank" do
      @post_it.allow_modification?(nil).should be_false
      @post_it.allow_modification?('').should be_false
    end

    it "return false if token is different" do
      @post_it.allow_modification?('wrong token').should be_false
      @post_it.allow_modification?(123456789).should be_false
    end
    
    it "return true if token is the same" do
      @post_it.allow_modification?(@post_it.token).should be_true
    end
  end
end
