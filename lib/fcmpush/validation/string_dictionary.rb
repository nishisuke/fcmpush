# frozen_string_literal: true

module Fcmpush
  module Validation
    module StringDictionary
      def validate(value)
        value.instance_of?(Hash) && value.values.all? { |v| v.instance_of?(String) }
      end
    end
  end
end
