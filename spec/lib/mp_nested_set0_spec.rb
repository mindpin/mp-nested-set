require "spec_helper"


MPNestedSet.config do
  add_scope('movie')

  add_scope('movie1', :options => {:depth => 3})
end


require 'model/book'

describe MPNestedSet do

  before {
    c1 = Category.create(:scope => 'movie')

    b1 = Book.create(:category => c1)
    b2 = Book.create(:category => c1)
    b3 = Book.create(:category => c1)

  }
  
  it 'of_categories_scope 为 2' do    
    Book.all.length.should eql(3)
  end

  it 'categories' do
    Book.categories.all.length.should eql(1)
  end
end



describe MPNestedSet do

  before {
    c = Category.create(:scope => 'movie222')

    b1 = Book.create(:category => c)
    b2 = Book.create(:category => c)
  }
  
  it 'of_categories_scope 为 0' do    
    Book.all.length.should eql(0)
  end
end

