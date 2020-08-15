# frozen_string_literal: true

module Fcmpush
  module Validation
    module FloatRate
      def validate(value)
        value.is_a?(Numeric) && (0..1).cover?(value.to_f)
      end
    end
  end
end
