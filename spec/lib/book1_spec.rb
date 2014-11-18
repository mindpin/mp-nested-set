require "spec_helper"


MPNestedSet.config do
  add_scope('movie')

  add_scope('movie1', :options => {:depth => 3})
end


require 'model/book1'



describe MPNestedSet do

  before {
    c1 = Category.create(:scope => 'movie1')
    c2 = c1.children.create(:scope => 'movie1')
    c3 = c2.children.create(:scope => 'movie1')
    c4 = c3.children.create(:scope => 'movie1')

    Book1.create(:category => c1)
  }
  
  it 'of_categories_scope 为 1' do    
    Book1.all.length.should eql(1)
  end

  it 'categories' do    
    Book1.categories.all.length.should eql(3)
  end
end



describe MPNestedSet do

  before {
    c1 = Category.create(:scope => 'movie1')
    c2 = c1.children.create(:scope => 'movie1')
    c3 = c2.children.create(:scope => 'movie1')

    Book1.create(:category => c1)
  }
  
  it 'of_categories_scope 为 1' do 
    Book1.all.length.should eql(1)
  end

  it 'categories' do    
    Book1.categories.all.length.should eql(3)
  end
end


describe MPNestedSet do

  before {
    c1 = Category.create(:scope => 'movie1')
    c2 = c1.children.create(:scope => 'movie1')

    Book1.create(:category => c1)
    Book1.create(:category => c2)
  }
  
  it 'of_categories_scope 为 1' do 
    Book1.all.length.should eql(2)
  end

  it 'categories' do    
    Book1.categories.all.length.should eql(2)
  end
end
