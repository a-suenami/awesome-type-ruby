module AwesomeType
  class Enum
    private_class_method :new

    class << self
      def define(*enums)
        @@enums ||= {}
        if enums.size == 1 && enums.first.is_a?(Hash)
          enums.first.each do |name, value|
            @@enums[name.to_sym] = value
          end
        elsif enums.all?{|enum| enum.is_a?(String) || enum.is_a?(Symbol) }
          enums.each.with_index(1) do |name, i|
            @@enums[name.to_sym] = i
          end
        else
          raise 'Invalid enum definitions.'
        end
      end

      def method_missing(name, *args)
        if args.empty? && @@enums[name.to_sym]
          new(@@enums[name.to_sym])
        else
          super
        end
      end
    end

    attr_reader :value

    def initialize(value)
      @value = value
    end

    def value_of(name)
      key = key.to_i if ordinal?
      @@enums.find do |enum_name, _|
        enum_name == name
      end
    end
  end
end
