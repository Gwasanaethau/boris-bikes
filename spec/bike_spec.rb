require 'bike'

describe Bike do
  context 'when created' do
    it { is_expected.not_to be_broken }
  end
  it 'can break' do
    subject.break
    expect(subject).to be_broken
  end
end
