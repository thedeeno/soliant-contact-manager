require 'soliant/contact-manager/contact'

module Soliant
module ContactManager

describe Contact do
  describe 'constructor' do
    it 'accepts options hash' do
      contact = Contact.new(
        first_name: 'first',
        last_name: 'last',
        phone: 'phone',
        email: 'email'
      )

      expect(contact.first_name).to eq('first')
      expect(contact.last_name).to eq('last')
      expect(contact.phone).to eq('phone')
      expect(contact.email).to eq('email')
    end
  end

  describe '#to_s' do
    let(:contact) { Contact.new(first_name: 'Dane', last_name: 'O\'Connor', phone: '555-555-5555', email: 'dane.oconnor@gmail.com') }

    subject { contact.to_s }

    it { is_expected.to eq('Last: O\'Connor, First: Dane, Phone: 555-555-5555, E-Mail: dane.oconnor@gmail.com') }
  end
end

end
end
