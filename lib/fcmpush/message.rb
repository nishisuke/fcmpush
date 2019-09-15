# frozen_string_literal: true

# https://firebase.google.com/docs/reference/fcm/rest/v1/projects.messages

module Fcmpush
  class Message
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

    def send(authorization:, validate_only: false, client_class: ::Fcmpush::Client)
      message = instance_variables.each.with_object({}) do |name, hash|
        val = instance_variable_get(name)
        unless val.nil?
          key = name.to_s.delete_prefix('@').to_sym
          hash[key] = val 
        end
      end
      body = { message: message, validate_only: validate_only }
      client = client_class.new(authorization: authorization)
      client.send(body)
    end

    def set_token(token)
      @token = token
    end

    def set_topic(topic)
      @topic = topic
    end

    def set_condition(condition)
      @condition = condition
    end

    def set_data(data)
      @data = data
    end

    def set_notification(title:, body:, image:)
      @notification = {
        title: title,
        body: body,
        image: image,
      }
    end

    def set_apns(headers:, payload:, fcm_options:)
      @apns = {
        headers: headers,
        payload: payload,
        fcm_options: fcm_options,
      }
    end

    def set_fcm_options(analytics_label:)
      @fcm_options = {
        analytics_label: analytics_label,
      }
    end

    # def set_android(android)
    # end

    # def set_webpush(webpush)
    # end


















    METHOD_NAME_TO_CLASS_NAME = constants(false)
      .reject { |n| n == :Value }
      .each
      .with_object({}) do |class_name, hash|

      key = "set_#{class_name.downcase}".to_sym
      hash[key] = class_name
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
