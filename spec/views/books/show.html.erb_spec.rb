require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :author_first_name => "Author First Name",
      :author_last_name => "Author Last Name",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Author First Name/)
    expect(rendered).to match(/Author Last Name/)
    expect(rendered).to match(/Title/)
  end
end
