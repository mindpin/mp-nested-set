# MPNestedSet

问题需求， https://github.com/mindpin/problems/wiki/%E5%88%86%E7%B1%BB%E7%BB%84%E4%BB%B6


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mp-nested-set'
```


分类模型
```ruby
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
```

供需要分类的业务模型 include 的 module
```ruby
module MPNestedSet
  module Use
    def self.included(base)
      base.extend ClassMethods
    end

    .....
    # 一些其他查询方法

    module ClassMethods
      def of_categories_scope(scope)
        # 注册使用 scope 这个分类
      end

      # 查询该业务模型 使用的 scope 下的所有分类
      def categories
      end
    end
  end
end
```

## 使用方式

增加配置
```ruby


MPNestedSet.config do
  # 增加一个 scope yyy
  add_scope :name => "yyy"  
  # 增加一个 scope xxx, 最多允许三层
  add_scope :name => "xxx", :options => {:depth => 3}
end
```

```ruby
# 返回通过 add_scope 注册过的 scope 数组
MPNestedSet.scopes # => ["yyy", "xxx"]
```

业务逻辑模型使用分类
```ruby
class Book
  include Mongoid::Document
  include Mongoid::Timestamps
  include MPNestedSet::Use

  of_categories_scope "yyy"
end
```