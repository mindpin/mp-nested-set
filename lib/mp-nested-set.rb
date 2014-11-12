require 'mongoid'

require "mp_nested_set/config"
require "mp_nested_set/category"


def add_scope(name, options = {})
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
        acts_as_nested_set
      end

      # 查询该业务模型 使用的 scope 下的所有分类
      def categories
      end
    end
  end
end
