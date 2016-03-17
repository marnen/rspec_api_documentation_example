class Book < ActiveRecord::Base
  validates_presence_of :author_first_name, :author_last_name, :title
end
