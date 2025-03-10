require './lib/ride'
require './lib/biker'
require 'pry'

RSpec.describe Biker do
  it 'exists' do
    biker = Biker.new("Kenny", 30)
    expect(biker).to be_a(Biker)
  end


end 