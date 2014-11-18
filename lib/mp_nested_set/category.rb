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


  validates :scope, :presence => true
  validate :check_scope_level

  def check_scope_level
    s = MPNestedSet.scopes.detect {|f| f[:name].eql? self.scope}
    return if s.nil? or s[:options].nil?

    depth = s[:options][:depth] - 1

    if Category.where(:scope => self.scope, :depth => {'$gte' => depth}).exists?
      errors.add(:base, '无法添加该分类')
    end
  end

end