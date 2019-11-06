require './lib/oystercard'

describe Oystercard do
  it 'checks that the oystercard has a balance' do
    oyster = Oystercard.new
    expect(oyster.balance).to eq(0)
  end

  it 'tops up balance of oystercard' do
    oyster = Oystercard.new
    amount = 10
    expect(oyster.topup(amount)).to eq(amount)
  end

  it 'raises an error if topped up beyond £90' do
    oyster = Oystercard.new
    amount = 10
    9.times { oyster.topup(amount) }
    expect { oyster.topup(amount) }.to raise_error 'Over limit of £90'
  end
  it 'deducts a fare from the oyster balance' do
    oyster = Oystercard.new
    amount = 10
    9.times { oyster.topup(amount) }
    fare = 10
    expect(oyster.deduct(fare)).to eq(80)
  end

  it 'touches in' do
    oyster = Oystercard.new
    expect(oyster.touch_in).to eq(true)
  end
end
