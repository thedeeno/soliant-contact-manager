require 'soliant/contact-manager/list'

module Soliant
module ContactManager

describe List do

  context 'when given sample data provided by client' do
    let(:path) { fixture_path('contacts.csv') }
    let(:list) { described_class.new(path) }

    it 'loads correct number of records' do
      expect(list.length).to eq(4)
    end

    it 'indexes email' do
      expect(list.index[:email].keys).to contain_exactly(
        'AmyJGhent@dayrep.com',
        'WilliamLShryock@rhyta.com',
        'TeresaCMcCrea@teleworm.us',
        'LisaESauceda@armyspy.com'
      )
    end

    it 'indexes last name' do
      expect(list.index[:last_name].keys).to contain_exactly(
        'Ghent',
        'Shryock',
        'McCrea',
        'Sauceda'
      )
    end

    describe '#find' do
      it 'returns contact with given email' do
        expect(list.find('AmyJGhent@dayrep.com')).to_not be_nil
      end

      it 'returns nil when email not found' do
        expect(list.find('bad-email-address')).to be_nil
      end
    end

    describe '#query' do
      let(:results) { list.query(:last_name, 'S') }

      it 'returns contacts who\'s given field starts with given letter' do
        expect(results.length).to eq(2)
      end

      it 'sorts results in descending order' do
        expect(results.map(&:last_name)).to eq %w[Sauceda Shryock]
      end
    end
  end
end

end
end
