require "spec_helper"


MPNestedSet.config do
  add_scope('movie0')

  add_scope('movie1', :options => {:depth => 3})
end


require 'book'

describe MpNestedSet do

  before {
    Book.create
    Book.create
  }
  
  it 'of_categories_scope 为 0' do    
    Book.all.length.should eql(0)
  end
end


