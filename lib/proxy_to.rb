require "proxy_to/version"
require "proxy_to/target"
require "proxy_to/class_extension"

module ProxyTo
end

Module.include ProxyTo::ClassExtension
