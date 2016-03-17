require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :author_first_name => "Author First Name",
        :author_last_name => "Author Last Name",
        :title => "Title"
      ),
      Book.create!(
        :author_first_name => "Author First Name",
        :author_last_name => "Author Last Name",
        :title => "Title"
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Author First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Author Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
