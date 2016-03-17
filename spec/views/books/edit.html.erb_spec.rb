require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :author_first_name => "MyString",
      :author_last_name => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input#book_author_first_name[name=?]", "book[author_first_name]"

      assert_select "input#book_author_last_name[name=?]", "book[author_last_name]"

      assert_select "input#book_title[name=?]", "book[title]"
    end
  end
end
