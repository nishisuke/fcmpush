# frozen_string_literal: true

module Fcmpush
  module Message
    class FcmOptions
      include Validatable

      def validate!
        analytics_label = value[:analytics_label]

        [
          analytics_label.nil? || analytics_label.instance_of?(String)  && !analytics_label.empty?,
        ].all?
      end
    end
  end
end
