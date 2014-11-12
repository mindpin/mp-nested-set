require "spec_helper"

MPNestedSet.config do
  add_scope('hi1')
  p MPNestedSet.scopes

  add_scope('hi1', :options => {:depth => 3})
  p MPNestedSet.scopes
end


describe MpNestedSet do
  it 'add_scope' do

    # MpNestedSet.config.add_scope.should eql('hello')
    # add_scope.should eql('hello')
  end
end
