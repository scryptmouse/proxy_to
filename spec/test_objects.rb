require 'singleton'

class ProxyTargetA
  def foo
    true
  end

  def bar
    true
  end
end

class ProxyTargetB
  def foo
    false
  end
end

class TestObjectWithA
  proxy_to :a

  def a
    ProxyTargetA.new
  end
end

class TestObjectWithAAndB
  proxy_to :b, :a

  def a
    ProxyTargetA.new
  end

  def b
    ProxyTargetB.new
  end
end

class TestSingleton
  include Singleton

  singleton_proxy_to :instance

  def something
  end
end

class PretendObject
  proxy_to :string, pretend: true

  def string
    "foobar"
  end
end

class MethodsTest
  proxy_to :a, methods: true

  def a
    ProxyTargetA.new
  end
end
