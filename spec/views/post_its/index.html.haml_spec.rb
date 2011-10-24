require 'spec_helper'

describe "post_its/index.html.haml" do
  before(:each) do
    assign(:post_its, [
      stub_model(PostIt,
        :title => "Title",
        :content => "MyText",
        :username => "Username",
        :email => "Email",
        :token => "Token"
      ),
      stub_model(PostIt,
        :title => "Title",
        :content => "MyText",
        :username => "Username",
        :email => "Email",
        :token => "Token"
      )
    ])
  end

  it "renders a list of post_its" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Token".to_s, :count => 2
  end
end
