require 'oyster.rb'

describe Oystercard do
    it 'Equals 0' do
      expect(subject.balance).to eq 0
    end

    describe 'deduct' do
      it { is_expected.to respond_to(:deduct).with(1).argument }

      it 'deducts an amount from the balance' do
        subject.top_up(20)
        expect{ subject.deduct 3}.to change{ subject.balance }.by -3
      end
    end

    describe '#top_up' do
      it { is_expected.to respond_to(:top_up).with(1).argument }
    
      it 'can top up balance' do
        expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
      end

      it "raises error when trying to top up when card hits limit" do
        max_balance = Oystercard::MAX_BALANCE
        subject.top_up max_balance
        expect{ subject.top_up 1 }.to raise_error 'Your card has hit the limit!'
      end
    end

    describe "touch_in" do
      it "should touch in and start journey" do
        subject.touch_in
        expect(subject.in_journey?).to eq true
      end
    end
end


