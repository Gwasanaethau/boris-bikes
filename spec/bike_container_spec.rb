require 'bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
  let(:bike) { Bike.new }
  let(:holder) { ContainerHolder.new }

  it { expect(holder).to respond_to :release_bike }

  it 'releases bikes that are not broken' do
    holder.dock double :bike, broken?: false
    bike = holder.release_bike
    expect(bike).not_to be_broken
  end

  it 'can dock a bike' do
    expect(holder.dock :bike).to eq nil
  end

  it 'raises error when no bikes available' do
    expect { holder.release_bike }.to raise_error 'No Bikes Available'
  end

  it 'raises an error when full' do
    20.times { holder.dock double :bike }
    expect { holder.dock double :bike }.to raise_error 'Station Full'
  end

  it 'does not release broken bikes' do
    broken_bike = double :bike, broken?: true
    holder.dock broken_bike
    expect { holder.release_bike }.to raise_error 'No Bikes Available'
  end

  it 'should accept a bike' do
    expect(holder.bike_count).to eq 0
    holder.dock bike
    expect(holder.bike_count).to eq 1
  end
end
