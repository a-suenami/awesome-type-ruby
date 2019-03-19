module AwesomeType
  module Optional
    @@types = {}

    class << self
      def [](type_const)
        return @@types[type_const] if @@types[type_const]

        klass = Class.new
        klass.class_eval do
          def self.type
            type_const
          end
        end
        klass.include AwesomeType::Optional::Klass
        AwesomeType::Optional.const_set(type_const.to_s, klass)
        @@types[type_const] ||= klass
      end
    end

    module Klass
      def initialize(value)
        if value.is_a?(self.class.type) || value.nil?
          @value = value
        else
          raise 'msg'
        end
      end

      def none?
        @value.nil?
      end

      def some?
        !none?
      end
    end
  end
end
