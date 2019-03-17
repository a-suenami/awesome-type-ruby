module AwesomeType
  # class OptionalKlass < Class
  # end

  module Optional
    @@types = {}

    class << self
      def [](type_const)
        return @@types[type_const] if @@types[type_const]

        klass = Class.new do
          @@type = type_const

          include AwesomeType::Optional::Klass
        end
        AwesomeType::Optional.const_set(type_const.to_s, klass)
        @@types[type_const] ||= klass
      end
    end

    def initialize(type)
      @type = type
    end

    module Klass
      def initialize(value)
      end
    end
  end
end
