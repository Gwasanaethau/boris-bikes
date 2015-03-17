require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it 'releases bikes that are not broken' do
    bike = subject.release_bike
    expect(bike).not_to be_broken
  end
end
