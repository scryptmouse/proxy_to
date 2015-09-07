module ProxyTo
  class Target < Module
    VALID = /@?\S+/i

    # @!attribute [r] target
    # @return [Symbol]
    attr_reader :target

    attr_reader :pretend
    alias_method :pretend?, :pretend

    attr_reader :methods
    alias_method :methods?, :methods

    # @param [String, Symbol] target
    def initialize(target, pretend: false, methods: false)
      @target   = target.to_sym
      @pretend  = pretend
      @methods  = methods

      proxy_methods!
      pretend_methods! if pretend?
      methods_method! if methods?
    end

    def inspect
      "ProxyTo::Target(:to => :#{target}, :pretend => #{pretend})"
    end

    private
    # @return [void]
    def proxy_methods!
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
      def respond_to?(method_name, include_all = false)
        super or #{target}.respond_to?(method_name, include_all)
      end

      def method_missing(method_name, *args, &block)
        if #{target}.respond_to? method_name
          #{target}.__send__(method_name, *args, &block)
        else
          super
        end
      end
      RUBY
    end

    def pretend_methods!
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
      def kind_of?(klass)
        super or #{target}.kind_of?(klass)
      end

      alias is_a? kind_of?
      RUBY
    end

    def methods_method!
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
      def methods(all = true)
        super | #{target}.methods(all)
      end
      RUBY
    end
  end
end
