require "fcmpush/version"

module Fcmpush
  class Error < StandardError; end
  # Your code goes here...

  autoload :Message, 'fcmpush/message'
end
