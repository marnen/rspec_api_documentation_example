require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Books' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  let(:raw_post) { params.to_json }
  let(:json) { JSON.parse response_body }

  response_field :id, 'Database ID of the book'
  response_field :author_first_name, "First name of the book's author"
  response_field :author_last_name, "Last name of the book's author"
  response_field :title, 'Title of the book'

  context 'existing book data' do
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
        expect(status).to be 200
        expect(json).to be_present
      end
    end
  end

  post '/books' do
    parameter :author_first_name, "First name of the book's author", required: true
    parameter :author_last_name, "Last name of the book's author", required: true
    parameter :title, 'Title of the book', required: true

    let(:author_first_name) { Faker::Name.first_name }
    let(:author_last_name) { Faker::Name.first_name }
    let(:title) { Faker::Lorem.sentence }

    example_request 'Create a book' do
      explanation 'Create a book and return data for it.'
      expect(status).to be 201
      expect(Book.count).to be 1
    end

    example_request 'Reject if title is blank', title: '   ' do
      explanation 'Nothing will be created if title is blank.'
      expect(400..499).to cover status
      expect(json['title']).to be == ["can't be blank"]
      expect(Book.count).to be 0
    end
  end
end
