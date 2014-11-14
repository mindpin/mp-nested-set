require 'mongoid'
require "mp_nested_set/config"
require "mp_nested_set/category"


module MPNestedSet

  module Use
    def self.included(base)
      base.extend ClassMethods
    end


    module ClassMethods
      # 注册使用 scope 这个分类
      def of_categories_scope(scope)
        MPNestedSet.user_scope = scope

        self.send(:validate, :_invalid_scope) unless MPNestedSet.scopes.include? scope

        self.send(:validate, :_check_scope_name)

        self.send(:validate, :_check_scope_level)
      end



      # 查询该业务模型 使用的 scope 下的所有分类
      def categories
        Category.where(:scope => MPNestedSet.user_scope[:name])
      end

    end

    private
      def _invalid_scope
        errors.add(:base, '无法添加该分类')
      end

      def _check_scope_name
        return if MPNestedSet.user_scope[:name].eql? self.category.scope

        errors.add(:base, '无法添加该分类')
      end

      def _check_scope_level
        if Category.where(:depth => self.category.depth + 4).exists?
          errors.add(:base, '无法添加该分类')
        end
      end

  end
end
