describe CloseSet do
  # describe 'いいはず' do
  #   it do
  #     expect(1).to eq 1
  #   end
  # end
  # ダメだった！(嬉しい)
  # describe 'ダメなはず' do
  #   it do
  #     expect(1).to eq 2
  #   end
  # end
  describe '閉区間クラスができている' do
    # 2つのテストの間に依存関係が生まれてしまっている。
    # letを消すのはいいが、それによってtestに依存関係が生まれてしまう。
    # letが信用できないならbefore eachでやるのがいいかもしれない。←習った！

    describe 'low_boundが入っている' do
      it do
        close_set = CloseSet.new(low_bound: 1, high_bound: 2)
        expect(close_set.low_bound).to eq 1
      end
    end
    describe 'high_boundが入っている' do
      it do
        close_set = CloseSet.new(low_bound: 1, high_bound: 2)
        expect(close_set.high_bound).to eq 2
      end
    end

    describe '数字以外が入ると' do
      it 'エラーが出る' do
        expect { CloseSet.new(low_bound: 'hoge', high_bound: 'huga') }.to raise_error(ArgumentError)
      end
    end

    describe 'low_bound>high_boundの時' do
      it 'エラーが出る' do
        expect { CloseSet.new(low_bound: 2, high_bound: 1) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#get_close_set_str' do
    describe 'get_close_set_strを呼ぶと' do
      close_set = CloseSet.new(low_bound: 1, high_bound: 2)
      close_set2 = CloseSet.new(low_bound: 2, high_bound: 3)
      it '閉区間に応じた文字列が返ってくる' do
        expect(close_set.get_close_set_str).to eq '[1,2]'
        expect(close_set2.get_close_set_str).to eq '[2,3]'
      end
    end
  end

  describe '#includes_num?' do
    close_set = CloseSet.new(low_bound: 1, high_bound: 5)
    describe '数値が閉区間の範囲の場合' do
      it 'trueが返る' do
        # expect(close_set.includes_num?(3)).to eq true # 自明　冗長なテスト
        expect(close_set.includes_num?(1)).to eq true # 下限
        expect(close_set.includes_num?(5)).to eq true # 上限
      end
    end

    describe '数値が閉区間の範囲外の場合' do
      it 'falseが返る' do
        expect(close_set.includes_num?(0)).to eq false # 下限より小さい
        expect(close_set.includes_num?(6)).to eq false # 上限より大きい
      end
    end
  end

  describe '#is_same?' do
    close_set = CloseSet.new(low_bound: 1, high_bound: 5)

    describe '関係ないものを入れた場合' do
      it 'エラーが出る' do
        expect { close_set.is_same?('hoge') }.to raise_error(ArgumentError)
      end
    end

    describe '同じ集合の場合' do
      close_set_same = CloseSet.new(low_bound: 1, high_bound: 5)
      it 'trueが返る' do
        expect(close_set.is_same?(close_set_same)).to eq true
      end
    end
    describe '違う集合の場合' do
      close_set_diff = CloseSet.new(low_bound: 1, high_bound: 6)
      it 'falseが返る' do
        expect(close_set.is_same?(close_set_diff)).to eq false
      end
    end
  end

  describe '#is_proper_subset?' do
    # 変数の宣言箇所が認知負荷高いのでリファクタリングをしたい
    close_set = CloseSet.new(low_bound: 1, high_bound: 5)

    describe '関係ないものを入れた場合' do
      it 'エラーが出る' do
        expect { close_set.is_proper_subset?('hoge') }.to raise_error(ArgumentError)
      end
    end

    describe '真部分集合の場合' do
      close_set_proper = CloseSet.new(low_bound: 2, high_bound: 4)
      it 'trueが返る' do
        expect(close_set.is_proper_subset?(close_set_proper)).to eq true
      end
    end

    describe '一致する場合' do
      close_set_samme = CloseSet.new(low_bound: 1, high_bound: 5)
      it 'trueが返る' do
        expect(close_set.is_proper_subset?(close_set_samme)).to eq true
      end
    end

    describe '真部分集合でない場合' do
      close_set_not_proper = CloseSet.new(low_bound: 1, high_bound: 6)
      close_set_not_proper2 = CloseSet.new(low_bound: 0, high_bound: 5)
      it 'falseが返る' do
        expect(close_set.is_proper_subset?(close_set_not_proper)).to eq false
        expect(close_set.is_proper_subset?(close_set_not_proper2)).to eq false
      end
    end
  end
end
