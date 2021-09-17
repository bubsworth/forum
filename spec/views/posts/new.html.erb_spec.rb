require "rails_helper"

RSpec.describe "posts/new.html.erb", type: :view do
	it "renders posts form" do
    post = FactoryBot.create(:post)
    assign(:post, post)

    render
    expect(rendered).to include "New post"
    assert_select "a[href='#{posts_path}']"
	end	
end
