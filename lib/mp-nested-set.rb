require 'mongoid'
require "mp_nested_set/config"
require "mp_nested_set/category"


def add_scope(name, options = nil)
  return MPNestedSet.scopes << {:name => name} if options.nil?

  MPNestedSet.scopes << {:name => name, :options => options[:options]}
end


module MPNestedSet

  module Use
    def self.included(base)
      base.extend ClassMethods
    end


    module ClassMethods
      # 注册使用 scope 这个分类
      def of_categories_scope(scope)
        p scope
        p MPNestedSet.scopes
        p MPNestedSet.scopes.include? scope
        return if MPNestedSet.scopes.include? scope

        self.send(:validate, :_invalid_scope)
      end

      # 查询该业务模型 使用的 scope 下的所有分类
      def categories
      end
    end

    private
      def _invalid_scope
        errors.add(:base, '无法添加该分类')
      end

  end
end
