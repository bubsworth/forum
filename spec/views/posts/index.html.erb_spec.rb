# frozen_string_literal: true

require "rails_helper"

RSpec.describe "posts/index.html.erb", type: :view do
  let(:post) { FactoryBot.create(:post, content: "test content", title: "test title") }
  let(:post_2) { FactoryBot.create(:post, content: "another test content", title: "test title 2") }

  before do
    assign(:post, post)
    assign(:post_2, post_2)
  end

  it "renders a heading" do
    render
    expect(rendered).to have_selector "h1", text: "Forum"
  end

  it "renders all posts" do
    render
    expect(rendered).to have_selector "h5", text: "test title"
    expect(rendered).to have_selector "h5", text: "test title 2"
  end

  it "renders a link to edit post" do
    render
    expect(rendered).to have_selector "a[href='#{edit_post_path(post)}']"
  end
end
