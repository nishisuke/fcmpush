# frozen_string_literal: true

module Fcmpush
  module Attribute
    class Base
      def initialize(value)
        @value = value
      end

      private

      attr_reader :value

      def validate(value)
        true
      end
    end
  end
end
