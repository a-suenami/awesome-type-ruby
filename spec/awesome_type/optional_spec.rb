require 'awesome_type/optional'

RSpec.describe AwesomeType::ImmutableStruct do
  it 'has array syntax (like type parameter).' do
    klass = AwesomeType::Optional[String]
    expect(klass).to eq AwesomeType::Optional::String
  end

  # it '' do
  #   optional_string = AwesomeType::Optional[String].new('It is a string.')
  #   expected(optional_string).to be_some
  # end
end
