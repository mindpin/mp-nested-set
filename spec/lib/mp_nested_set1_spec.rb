require "spec_helper"


MPNestedSet.config do
  add_scope('movie', :options => {:depth => 3})

  add_scope('movie1')
end


require 'model/book1'

describe MpNestedSet do

  before {
    c1 = Category.create
    c2 = c1.children.create
    c3 = c2.children.create
    c4 = c3.children.create
    c5 = c4.children.create

    Book1.create(:category => c1)
  }
  
  it 'of_categories_scope 为 0' do    
    Book1.all.length.should eql(0)
  end
end


describe MpNestedSet do

  before {
    c1 = Category.create(:scope => 'movie')
    c2 = c1.children.create
    c3 = c2.children.create
    c4 = c3.children.create
    c5 = c4.children.create

    Book1.create(:category => c1)
  }
  
  it 'of_categories_scope 为 0' do    
    Book1.all.length.should eql(0)
  end
end





describe MpNestedSet do

  before {
    c1 = Category.create(:scope => 'movie1')
    c2 = c1.children.create
    c3 = c2.children.create
    c4 = c3.children.create

    Book1.create(:category => c1)
  }
  
  it 'of_categories_scope 为 0' do 
    Book1.all.length.should eql(0)
  end
end





describe MpNestedSet do

  before {
    c1 = Category.create(:scope => 'movie')
    c2 = c1.children.create
    c3 = c2.children.create
    c4 = c3.children.create

    Book1.create(:category => c1)
  }
  
  it 'of_categories_scope 为 1' do 
    Book1.all.length.should eql(1)
  end
end
