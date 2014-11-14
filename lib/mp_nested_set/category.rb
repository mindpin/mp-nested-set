require 'mongoid_nested_set'

class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  acts_as_nested_set

  field :name,      :type => String
  # field :parent_id, :type => Integer
  # field :lft,       :type => Integer
  # field :rgt,       :type => Integer
  # field :depth,     :type => Integer
  field :scope,     :type => String
end