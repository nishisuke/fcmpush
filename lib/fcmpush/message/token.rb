# frozen_string_literal: true

module Fcmpush
  module Message
    class Token
      include Validatable

      def validate!
        value.instance_of?(String) && !value.empty?
      end
    end
  end
end
