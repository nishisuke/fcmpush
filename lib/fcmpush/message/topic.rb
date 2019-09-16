# frozen_string_literal: true

module Fcmpush
  module Message
    class Topic
      include Validatable

      def validate!
        unless value.instance_of?(String) && !value.empty? && value.start_with?('/topics/')
          raise ::Fcmpush::ValidationError, "#{self.class.name} must be string or nil like 'weather'. It should not be start with '/topics/'."
        end
      end
    end
  end
end
