# frozen_string_literal: true

describe UnityPretty::Parsers::License do
  it 'should contain only Gem::Version objects' do
    # LICENSE SYSTEM [YYYYdd 13:47:26] Next license update check is after 2019-01-31T02:16:03
    # LICENSE SYSTEM [201921 13:47:26] Next license update check is after 2019-01-31T02:16:03
    # foo = UnityPretty::Parsers::License.new
    # line = 'LICENSE SYSTEM [201921 13:47:26] Next license update check is after 2019-01-31T02:16:03'
    # expect(foo.match(line)).to equal('bar')
  end
end
