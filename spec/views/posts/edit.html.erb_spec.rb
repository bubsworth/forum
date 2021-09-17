require "rails_helper"

RSpec.describe "posts/edit.html.erb", type: :view do
	it "renders posts form" do
    post = FactoryBot.create(:post)
    assign(:post, post)

    render
    expect(rendered).to include "Edit post"
    assert_select "a[href='#{posts_path}']"
	end	
end
