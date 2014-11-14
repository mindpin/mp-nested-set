class Book1
  include Mongoid::Document
  include Mongoid::Timestamps
  include MPNestedSet::Use

  belongs_to :category

  of_categories_scope :name => 'movie', :options => {:depth => 3}

end