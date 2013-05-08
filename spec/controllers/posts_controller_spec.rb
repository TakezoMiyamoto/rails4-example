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

describe PostsController do

  # This should return the minimal set of attributes required to create a valid
  # Post. As you add validations to Post, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryGirl.attributes_for(:post) }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PostsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before do
    @post = Post.create! valid_attributes
  end

  describe "GET index" do
    subject(:action){ get :index, {}, valid_session }
    it "assigns all posts as @posts" do
      subject
      expect(assigns(:posts)).to eq([@post])
    end
  end

  describe "GET show" do
    subject { get :show, {id: @post.to_param}, valid_session }
    it "assigns the requested post as @post" do
      subject
      expect(assigns(:post)).to eq(@post)
    end
  end

  describe "GET new" do
    subject(:action){ get :new, {}, valid_session }
    it "assigns a new post as @post" do
      subject
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET edit" do
    subject(:action){ get :edit, {id: @post.to_param}, valid_session }
    it "assigns the requested post as @post" do
      subject
      expect(assigns(:post)).to eq(@post)
    end
  end

  describe "POST create" do
    subject(:action){ post :create, {post: attributes}, valid_session }
    describe "with valid params" do
      let(:attributes){ valid_attributes }
      it "creates a new Post" do
        expect{subject}.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        subject
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the created post" do
        expect(subject).to redirect_to(Post.last)
      end
    end

    describe "with invalid params" do
      let(:attributes){ { "user" => "invalid value" } }
      it "assigns a newly created but unsaved post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        subject
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        expect(subject).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    subject(:action){ put :update, {id: @post.to_param, post: attributes}, valid_session }
    describe "with valid params" do
      let(:attributes){ { "user" => "" } }
      it "updates the requested post" do
        # Assuming there are no other posts in the database, this
        # specifies that the Post created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Post.any_instance.should_receive(:update).with(attributes)
        subject
      end

      it "assigns the requested post as @post" do
        subject
        expect(assigns(:post)).to eq(@post)
      end

      it "redirects to the post" do
        subject
        expect(response).to redirect_to(@post)
      end
    end

    describe "with invalid params" do
      let(:attributes){ { "user" => "invalid value" } }
      it "assigns the post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        subject
        expect(assigns(:post)).to eq(@post)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        expect(subject).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    subject(:action){ delete :destroy, {id: @post.to_param}, valid_session }
    it "destroys the requested post" do
      expect{subject}.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      expect(subject).to redirect_to(posts_url)
    end
  end

end