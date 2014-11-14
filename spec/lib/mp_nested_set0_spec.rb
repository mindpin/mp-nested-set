require "spec_helper"


MPNestedSet.config do
  add_scope('movie')

  add_scope('movie1', :options => {:depth => 3})
end


require 'model/book'

describe MpNestedSet do

  before {
    c1 = Category.create(:scope => 'movie')

    b1 = Book.create(:category => c1)
    b2 = Book.create(:category => c1)


  }
  
  it 'of_categories_scope 为 2' do    
    Book.all.length.should eql(2)
  end

  it 'categories' do
    p Book.categories.first
  end
end


