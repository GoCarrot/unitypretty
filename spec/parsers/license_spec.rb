# frozen_string_literal: true

describe UnityPretty::Parsers::License do
  describe '#parse' do
    with_line 'LICENSE SYSTEM [201921 13:47:26] Next license update check is after 2019-01-31T02:16:03' do
      it { should have_attributes date: DateTime.parse('2019-02-01T13:47:26') }
      it { should have_attributes next_date: DateTime.parse('2019-01-31T02:16:03') }
    end

    with_line 'LICENSE SYSTEM [2019422 17:3:2] Next license update check is after 2019-04-23T18:10:19' do
      it { should have_attributes date: DateTime.parse('2019-04-22T17:03:02') }
      it { should have_attributes next_date: DateTime.parse('2019-04-23T18:10:19') }
    end

    with_line 'LICENSE SYSTEM [201911 17:3:2] Next license update check is after 2019-04-23T18:10:19' do
      it { should have_attributes date: DateTime.parse('2019-01-01T17:03:02') }
      it { should have_attributes next_date: DateTime.parse('2019-04-23T18:10:19') }
    end

    with_line 'LICENSE SYSTEM [2019111 17:3:2] Next license update check is after 2019-04-23T18:10:19' do
      it { should have_attributes date: DateTime.parse('2019-11-01T17:03:02') }
      it { should have_attributes next_date: DateTime.parse('2019-04-23T18:10:19') }
    end

    with_line 'LICENSE SYSTEM [201912 17:3:2] Next license update check is after 2019-04-23T18:10:19' do
      it { should have_attributes date: DateTime.parse('2019-01-02T17:03:02') }
      it { should have_attributes next_date: DateTime.parse('2019-04-23T18:10:19') }
    end

    with_line 'LICENSE SYSTEM [2019122 17:3:2] Next license update check is after 2019-04-23T18:10:19' do
      it { should have_attributes date: DateTime.parse('2019-12-02T17:03:02') }
      it { should have_attributes next_date: DateTime.parse('2019-04-23T18:10:19') }
    end

    with_line 'LICENSE SYSTEM [201913 17:3:2] Next license update check is after 2019-04-23T18:10:19' do
      it { should have_attributes date: DateTime.parse('2019-01-03T17:03:02') }
      it { should have_attributes next_date: DateTime.parse('2019-04-23T18:10:19') }
    end
  end
end
