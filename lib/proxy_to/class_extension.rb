module ProxyTo
  module ClassExtension
    # @param [<String, Symbol>] targets
    # @return [void]
    def proxy_to(*targets, **options)
      targets.reverse_each do |target|
        include ProxyTo::Target.new target, **options
      end
    end

    # @param [<String, Symbol>] targets
    def singleton_proxy_to(*targets, **options)
      targets.reverse_each do |target|
        extend ProxyTo::Target.new target, **options
      end
    end
  end
end
