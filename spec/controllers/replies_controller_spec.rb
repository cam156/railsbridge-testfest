require 'rails_helper'

RSpec.describe RepliesController, type: :controller do
  describe "RepliesController" do

    let(:reply) { Reply.new(
      body: 'ahahahahahahah',
      user_id: 10,
      post_id: 1,
      ) }

    let(:user) { User.create!(email: 'abc@def.com', password: 'password')}
    let(:post) do
      post = Post.create(
      title: 'What is the difference between a cookie and a session?',
      user_id: user.id,
      content: 'What are the diffences with these key/value pairs?',
      )
      post
    end

    describe '#new' do

      it "renders the new view" do
        get :new, params: {post_id: post.id}
        expect(response).to render_template("new")
      end

      it "assigns a new reply to @reply" do
        get :new, params: {post_id: post.id}
        expect(assigns(:reply)).to be_a_new(Reply)
      end

      it "renders html" do
        get :new, params: {post_id: post.id}
        expect(response.content_type).to eq "text/html"
      end
    end
  end
end
