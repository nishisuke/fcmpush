# frozen_string_literal: true

module Fcmpush
  module Message
    class FcmOptions
      include Validatable

      def validate!
        analytics_label = value[:analytics_label]

        conditions = [
          analytics_label.nil? || analytics_label.instance_of?(String)  && !analytics_label.empty?,
        ]
        unless conditions.all?
          raise ::Fcmpush::ValidationError, "#{self.class.name} analytics_label must be string or nil. It should not be empty."
        end
      end
    end
  end
end
