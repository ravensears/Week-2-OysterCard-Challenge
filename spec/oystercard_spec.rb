require 'oyster'

describe Oystercard do
    it 'Equals 0' do
      expect(subject.balance).to eq 0
    end

    context '#top_up' do
      it { is_expected.to respond_to(:top_up).with(1).argument }

      it 'can top up balance' do
        expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
      end
    end

    context '#deduct_fare' do
      it { is_expected.to respond_to(:deduct_fare).with(1).argument }

      it 'deducts fare from the balance' do
        expect{ subject.deduct_fare(1) }.to change{ subject.balance }.by (-1)
      end
    end  

    it 'raises error when trying to top up when card hits limit' do
      subject.top_up(Oystercard::MAX_BALANCE)
      expect{ subject.top_up(1) }.to raise_error 'Your card has hit the limit!'
    end
    
    it '#touch_in' do
      subject.top_up(Oystercard::MAX_BALANCE)
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end

    it 'will not touch in if below minimum balance' do
      subject.deduct_fare(Oystercard::DEFAULT_BALANCE)
      expect{ subject.touch_in }.to raise_error 'Insufficient balance to touch in'
    end
    
    it '#touch_out' do
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
end