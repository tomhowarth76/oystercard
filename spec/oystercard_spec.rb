require './lib/oystercard'

describe Oystercard do
  let (:oyster) {Oystercard.new}
  it 'checks that the oystercard has a balance' do
  #  oyster = Oystercard.new
    expect(oyster.balance).to eq(0)
  end

  it 'tops up balance of oystercard' do
  #  oyster = Oystercard.new
    amount = 10
    expect(oyster.topup(amount)).to eq(amount)
  end

  it 'raises an error if topped up beyond £90' do
  #  oyster = Oystercard.new
    amount = 10
    9.times { oyster.topup(amount) }
    expect { oyster.topup(amount) }.to raise_error 'Over limit of £90'
  end
  # it 'deducts a fare from the oyster balance' do
  # #  oyster = Oystercard.new
  #   amount = 10
  #   9.times { oyster.topup(amount) }
  #   fare = 10
  #   expect(oyster.deduct(fare)).to eq(80)
  # end

  it 'touches in if over minimum fare' do
#    oyster = Oystercard.new
    oyster.topup(10)
    expect(oyster.touch_in).to be(true)
  end

  it 'touches out' do
#    oyster = Oystercard.new
    expect(oyster.touch_out).to be(false)
  end
  it 'knows it is in journey' do
  #   oyster = Oystercard.new
      oyster.topup(10)
      oyster.touch_in
     expect(oyster.in_journey?).to be(true)
  end
  it 'raises an error if touched in below minimum fare' do
#    oyster = Oystercard.new
    expect { oyster.touch_in }.to raise_error 'Balance must be over £1'
  end
  it 'reduces the balance by the fare' do
    fare = 1
    oyster.topup(10)
    expect { oyster.touch_out }.to change { oyster.balance }.by(-fare)
  end
end
