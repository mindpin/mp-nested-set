class Book
  include Mongoid::Document
  include Mongoid::Timestamps
  include MPNestedSet::Use

  of_categories_scope :name => 'movie'

  # validate :check_scope

  # def check_scope
  #   errors.add(:base, 'ddd')
  # end

end