require 'awesome_type/optional'

RSpec.describe AwesomeType::ImmutableStruct do
  it 'has array syntax (like type parameter).' do
    klass = AwesomeType::Optional[String]
    expect(klass).to eq AwesomeType::Optional::String
  end
end
