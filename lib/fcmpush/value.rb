# frozen_string_literal: true

module Fcmpush
  class Message
    class Value
      class InvalidError < ::Fcmpush::Error
        attr_reader :value

        def initialize(value)
          @value = value
        end
      end

      def initialize(**hash)
        hash.each_pair do |key, val|
          instance_variable_set("@#{key}", val)
        end
      end

      def valid!
        raise InvalidError.new(self) unless valid?
        self
      end

      def valid?
        false
      end
    end
  end
end
