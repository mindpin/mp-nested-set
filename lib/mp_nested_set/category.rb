class Category
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,      :type => String
  field :parent_id, :type => Integer
  field :lft,       :type => Integer
  field :rgt,       :type => Integer
  field :depth,     :type => Integer
  field :scope,     :type => String
end
