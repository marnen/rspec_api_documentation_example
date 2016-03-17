require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Books' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  let(:json) { JSON.parse response_body }

  context 'existing book data' do
    response_field :id, 'Database ID of the book'
    response_field :author_first_name, "First name of the book's author"
    response_field :author_last_name, "Last name of the book's author"
    response_field :title, 'Title of the book'

    get '/books' do
      example 'Get a list of books' do
        explanation 'Return a list of books, in no particular order.'
        FactoryGirl.create_list :book, 3
        do_request

        expect(status).to be 200
      end
    end

    get '/books/:id' do
      let(:book) { FactoryGirl.create :book }
      let(:id) { book.id }

      example_request 'Get data for one book' do
        explanation 'Return data for the book with ID `:id`.'
        expect(json).to be_present
      end
    end
  end
end
