class HogeViewModel
  attribute :id, type: Type::Hoge::Id
  attribute :name, type: Type::Hoge::Name
  attribute :address, type: AwesomeType::Optional[Type::Hoge::Address]
end

class ViewModel
  def initialize(args)
    args.each do |k, v|
      @attributes =
        if v.is_a?(@attribute_types[k])
          @attribute_values[k] = v
        else
          @attribute_values[k] = @attribute_types[k].new(v)
        end
    end
  end
end
