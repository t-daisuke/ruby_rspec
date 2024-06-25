describe OpenSet do
  describe '閉区間クラスができている' do
    # これ冗長かな？
    close_set = OpenSet.new(low_bound: 1, high_bound: 2)
    describe 'low_boundが入っている' do
      it do
        expect(close_set.low_bound).to eq 1
      end
    end
    describe 'high_boundが入っている' do
      it do
        expect(close_set.high_bound).to eq 2
      end
    end

    describe '数字以外が入ると' do
      it 'エラーが出る' do
        expect { OpenSet.new(low_bound: 'hoge', high_bound: 'huga') }.to raise_error(ArgumentError)
      end
    end

    describe 'low_bound>high_boundの時' do
      it 'エラーが出る' do
        expect { OpenSet.new(low_bound: 2, high_bound: 1) }.to raise_error(ArgumentError)
      end
    end
  end
end
