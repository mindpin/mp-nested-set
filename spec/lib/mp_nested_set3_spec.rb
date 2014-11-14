require "spec_helper"

MPNestedSet.config do
  add_scope('movie', :options => {:depth => 3})
end


describe MPNestedSet do

  before {
    root = Category.create(:name => 'Root Category')

    p root.depth

    c1 = root.children.create(:name => 'Child Category #1')

    p c1.depth
  }

  it 'categories' do
    p Category.all.length
  end
end


