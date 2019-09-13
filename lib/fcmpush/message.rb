# frozen_string_literal: true

require_relative 'message/value' # Must be first

require_relative 'message/token'
require_relative 'message/topic'
require_relative 'message/condition'
require_relative 'message/notification'
require_relative 'message/data'
require_relative 'message/apns'
require_relative 'message/android'
require_relative 'message/webpush'
require_relative 'message/fcm_options'

module Fcmpush
  class Message
    METHOD_NAME_TO_CLASS_NAME = constants(false)
      .reject { |n| n == :Value }
      .each
      .with_object({}) do |class_name, hash|

      key = "set_#{class_name.downcase}".to_sym
      hash[key] = class_name
    end

    def initialize
      @token = nil
      @topic = nil
      @condition = nil
      @data = nil
      @notification = nil
      @android = nil
      @webpush = nil
      @apns = nil
      @fcm_options = nil
    end

    private

    def method_missing(name, *args)
      if class_name = class_name_to_set(name)
        set_value(class_name)
      else
        super
      end
    end

    def respond_to_missing?(symbol, include_private)
      !!class_name_to_set(symbol)
    end

    def class_name_to_set(method_name)
      METHOD_NAME_TO_CLASS_NAME[method_name]
    end

    def set_value(class_name)
      klass = self.class.const_get(class_name)
      object = klass.new(args.first).valid!
      instance_variable_set("@#{class_name.downcase}", object)
    end
  end
end
