# frozen_string_literal: true

module Fcmpush
  module Message
    class Data
      include Validatable

      def validate!
        value.instance_of?(Hash) && value.values.all? { |v| v.instance_of?(String)  && !v.empty? }
      end
    end
  end
end
