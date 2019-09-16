# frozen_string_literal: true

module Fcmpush
  class Message
    class Notification
      include ::Fcmpush::ValidatableObject

      def validate!
        title = value[:title]
        body = value[:body]
        image = value[:image]

        conditions = [
          title.nil? || title.instance_of?(String) && !title.empty?,
          body.nil? || body.instance_of?(String)  && !body.empty?,
          image.nil? || image.instance_of?(String) && image.match?(URI.regexp),
        ]

        unless conditions.all?
          raise ::Fcmpush::ValidationError, "#{self.class.name} title, body and image must be string or nil. They should not be empty. Image should be URI."
        end
      end
    end
  end
end
