require "rails_helper"

RSpec.describe "Posts", type: :request do
  before do
    # sign_in FactoryBot.create(:user)
  end

  describe "GET /posts" do

    it "returns http success" do
      get "/posts"
      expect(response).to have_http_status(:success)
      expect(response.body).to include "Forum"
    end

    it "lists all posts" do
      FactoryBot.create(:post, title: "Lots to talk about", content: "Some very cool content")
      FactoryBot.create(:post, title: "Welcome my peeps!", content: "Even more cool content")

      get "/posts"
      expect(response.body).to include("Lots to talk about")
      expect(response.body).to include("Welcome my peeps!")
      expect(response.body).to include("Some very cool content")
      expect(response.body).to include("Even more cool content")
    end
  end

  describe "GET /posts/new" do
    it "renders a form for a new post" do
      get new_post_path
      assert_select "form[action='#{posts_path}']"
    end
  end

  describe "POST /posts" do
    let(:params) do
      {
        title: "Something amazing and cool",
        content: "Content that is amazing and cool",
      }
    end

    before do
      post "/posts", params: {post: params}
    end

    it "creates a new post" do
      post = Post.last
      expect(post).to be
      expect(post.title).to eq "Something amazing and cool"
      expect(post.content).to eq "Content that is amazing and cool"
    end

    it "redirects to posts index" do
      expect(response).to redirect_to posts_path
    end

    it "sets a flash notice" do
      expect(flash[:notice]).to eq "Added new post."
    end
  end

  describe "GET /posts/:id/edit" do
    let(:post) { FactoryBot.create(:post) }

    it "renders a form to edit the post" do
      get "/posts/#{post.id}/edit"
      assert_select "form[action='#{post_path(post)}']"
    end

    context "when post does not exist" do
      it "raises an error" do
        expect { get "/posts/1/edit" }
          .to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  describe "PATCH /posts/:id" do
    context "with valid params" do
      before do
        @post = FactoryBot.create(
          :post, title: "Something also amazing and cool"
        )
        patch(
          "/posts/#{@post.id}",
          params: {
            post: {title: "Another amazing and cool"}
          }
        )
      end

      it "updates the post" do
        @post.reload
        expect(@post.title).to eq "Another amazing and cool"
      end

      it "redirects to admin posts path" do
        expect(response).to redirect_to posts_path
      end
    end
  end

  describe "DELETE /posts/:id" do
    context "when post exists" do
      let(:post) { FactoryBot.create(:post) }
      before { delete "/posts/#{post.id}" }

      it "destroys the post" do
        expect(Post.exists?(post.id)).to be_falsey
      end

      it "redirects to posts index" do
        expect(response).to redirect_to posts_path
      end

      it "sets a flash notice" do
        expect(flash[:notice]).to eq "Post deleted."
      end
    end

    context "when post does not exist" do
      it "raises an error" do
        expect { delete("/posts/1") }
          .to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end
