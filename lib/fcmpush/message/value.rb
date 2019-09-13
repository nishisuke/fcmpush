# frozen_string_literal: true

module Fcmpush
  class Message
    class Value
      def initialize(**hash)
        hash.each_pair do |key, val|
          instance_variable_set("@#{key}", val)
        end
      end

      def valid?
        raise NotImplementedError
      end
    end
  end
end
