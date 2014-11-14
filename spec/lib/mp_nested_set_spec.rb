require "spec_helper"


MPNestedSet.config do
  add_scope('movie')

  add_scope('movie1', :options => {:depth => 3})
end


require 'book'

describe MpNestedSet do
  
  it 'of_categories_scope' do

    Book.create()
    
    Book.all.length.should eql(1)
  end
end


