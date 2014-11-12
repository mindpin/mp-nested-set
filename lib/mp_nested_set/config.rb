module MPNestedSet
  @@scopes = []

  class << self
    attr_accessor :configure

    def config
      yield self.configure ||= Configure.new
    end

    def scopes
      @@scopes
    end
  end

  
  class Configure

    def initialize
      @scopes = Hash.new
    end

  end

end