module MPNestedSet
  @@scopes = []
  @@user_scope = Hash.new

  class << self
    attr_accessor :user_scope

    def config(&block)
      self.instance_eval &block
    end

    def add_scope(name, options = nil)
      return MPNestedSet.scopes << {:name => name} if options.nil?

      MPNestedSet.scopes << {:name => name, :options => options[:options]}
    end

    def scopes
      @@scopes
    end

  end

end