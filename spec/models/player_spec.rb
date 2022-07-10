require 'rails_helper'

RSpec.describe Player, type: :model do
  context 'validation test' do
    subject do
      Player.create(email: 'user@gmail.com', password: '123456')
    end
    before { subject.save }

    it 'should be invalid email' do
      subject.email = ''
      expect(subject).to_not be_valid
    end
  end
end
