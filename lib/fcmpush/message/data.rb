# frozen_string_literal: true

module Fcmpush
  class Message
    class Data
      include ::Fcmpush::ValidatableObject

      def validate!
        unless value.instance_of?(Hash) && value.values.all? { |v| v.instance_of?(String) && !v.empty? }
          raise ::Fcmpush::ValidationError, "#{self.class.name} must be dictionary. It's values must be string."
        end
      end
    end
  end
end
