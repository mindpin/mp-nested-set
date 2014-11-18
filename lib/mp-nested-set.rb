require 'mongoid'
require "mp_nested_set/config"
require "mp_nested_set/category"


module MPNestedSet

  module Use
    def self.included(base)
      base.extend ClassMethods
    end


    module ClassMethods

      attr_accessor :scope

      # 注册使用 scope 这个分类
      def of_categories_scope(scope)
        self.scope = scope

        unless MPNestedSet.scopes.detect {|f| f[:name].eql? scope}
          self.send(:validate, :_invalid_scope)
        end
        
        self.send(:validate, :_check_scope)
      end



      # 查询该业务模型 使用的 scope 下的所有分类
      def categories
        Category.where(:scope => self.scope)
      end

    end

    private
      def _invalid_scope
        errors.add(:base, '无法添加该分类')
      end

      def _check_scope
        return if self.class.scope.eql? self.category.scope

        errors.add(:base, '无法添加该分类')
      end

  end
end
