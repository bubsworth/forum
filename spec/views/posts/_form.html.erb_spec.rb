require "rails_helper"

RSpec.describe "posts/_form.html.erb", type: :view do
  it "contains post fields" do
    assign(:post, Post.new)
    render
    expect(rendered).to have_css "input[name='post[title]']"
    expect(rendered).to have_css "textarea[name='post[content]']"
  end
end
