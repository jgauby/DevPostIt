require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PostItsController do

  # This should return the minimal set of attributes required to create a valid
  # PostIt. As you add validations to PostIt, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      'title' =>  'Hello word in Ruby',
      'content' => 'puts "Hello world !',
      'username' => 'user',
      'email'    => 'user@test.com',
      'language' => 'Ruby'
    }
  end

  describe "GET index" do
    it "assigns all post_its as @post_its" do
      post_it = PostIt.create! valid_attributes
      get :index
      assigns(:post_its).should eq([post_it])
    end
  end

  describe "GET show" do
    it "assigns the requested post_it as @post_it" do
      post_it = PostIt.create! valid_attributes
      get :show, :id => post_it.id.to_s
      assigns(:post_it).should eq(post_it)
    end
  end

  describe "GET new" do
    it "assigns a new post_it as @post_it" do
      get :new
      assigns(:post_it).should be_a_new(PostIt)
    end
  end

  describe "GET edit" do
    it "assigns the requested post_it as @post_it" do
      post_it = PostIt.create! valid_attributes
      get :edit, :id => post_it.id.to_s
      assigns(:post_it).should eq(post_it)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PostIt" do
        expect {
          post :create, :post_it => valid_attributes
        }.to change(PostIt, :count).by(1)
      end

      it "assigns a newly created post_it as @post_it" do
        post :create, :post_it => valid_attributes
        assigns(:post_it).should be_a(PostIt)
        assigns(:post_it).should be_persisted
      end

      it "redirects to the created post_it" do
        post :create, :post_it => valid_attributes
        response.should redirect_to(PostIt.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post_it as @post_it" do
        # Trigger the behavior that occurs when invalid params are submitted
        PostIt.any_instance.stub(:save).and_return(false)
        post :create, :post_it => {}
        assigns(:post_it).should be_a_new(PostIt)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PostIt.any_instance.stub(:save).and_return(false)
        post :create, :post_it => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested post_it" do
        post_it = PostIt.create! valid_attributes
        # Assuming there are no other post_its in the database, this
        # specifies that the PostIt created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PostIt.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => post_it.id, :post_it => {'these' => 'params'}
      end

      it "assigns the requested post_it as @post_it" do
        post_it = PostIt.create! valid_attributes
        put :update, :id => post_it.id, :post_it => valid_attributes
        assigns(:post_it).should eq(post_it)
      end

      it "redirects to the post_it" do
        post_it = PostIt.create! valid_attributes
        put :update, :id => post_it.id, :post_it => valid_attributes
        response.should redirect_to(post_it)
      end
    end

    describe "with invalid params" do
      it "assigns the post_it as @post_it" do
        post_it = PostIt.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PostIt.any_instance.stub(:save).and_return(false)
        put :update, :id => post_it.id.to_s, :post_it => {}
        assigns(:post_it).should eq(post_it)
      end

      it "re-renders the 'edit' template" do
        post_it = PostIt.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PostIt.any_instance.stub(:save).and_return(false)
        put :update, :id => post_it.id.to_s, :post_it => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post_it" do
      post_it = PostIt.create! valid_attributes
      expect {
        delete :destroy, :id => post_it.id.to_s
      }.to change(PostIt, :count).by(-1)
    end

    it "redirects to the post_its list" do
      post_it = PostIt.create! valid_attributes
      delete :destroy, :id => post_it.id.to_s
      response.should redirect_to(post_its_url)
    end
  end

end
