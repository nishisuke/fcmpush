# frozen_string_literal: true

module Fcmpush
  module Message
    class Token
      include Validatable

      def validate!
        unless value.instance_of?(String) && !value.empty?
          raise ::Fcmpush::ValidationError, "#{self.class.name} must be string or nil. It should not be empty."
        end
      end
    end
  end
end
