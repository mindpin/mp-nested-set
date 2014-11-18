class Book
  include Mongoid::Document
  include Mongoid::Timestamps
  include MPNestedSet::Use

  belongs_to :category

  of_categories_scope 'movie'

end