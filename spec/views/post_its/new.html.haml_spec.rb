require 'spec_helper'

describe "post_its/new.html.haml" do
  before(:each) do
    assign(:post_it, stub_model(PostIt,
      :title => "MyString",
      :content => "MyText",
      :username => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new post_it form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => post_its_path, :method => "post" do
      assert_select "input#post_it_title", :name => "post_it[title]"
      assert_select "textarea#post_it_content", :name => "post_it[content]"
      assert_select "input#post_it_username", :name => "post_it[username]"
      assert_select "input#post_it_email", :name => "post_it[email]"
    end
  end
end
