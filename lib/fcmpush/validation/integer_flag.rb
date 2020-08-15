# frozen_string_literal: true

module Fcmpush
  module Validation
    module IntegerFlag
      def validate(value)
        value.is_a?(Numeric) && value.to_i == 1
      end
    end
  end
end
