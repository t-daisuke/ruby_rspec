describe Sample do
  # let(:sample){ Sample.new }

  # describe "#say" do
  #   describe "Using expect to" do
  #     let(:greeting){ "Hello" }

  #     it "should say 'Hello TDD BootCamp!'" do
  #       expect(sample.say(greeting)).to eq "Hello TDD BootCamp!"
  #     end
  #   end

  #   describe "Using subject it should " do
  #     subject { sample.say(greeting) }

  #     let(:greeting){ "Yeah!" }
  #     it { should eq "Yeah! TDD BootCamp!" }
  #   end

  #   describe "Using power assert " do
  #     let(:greeting){ "Wow!" }

  #     it do
  #       is_asserted_by{ sample.say(greeting) == "Wow! TDD BootCamp!" }
  #     end
  #   end
  # end
  describe 'いいはず' do
    it do
      expect(1).to eq 1
    end
  end
  # ダメだった！(嬉しい)
  # describe 'ダメなはず' do
  #   it do
  #     expect(1).to eq 2
  #   end
  # end
  describe '(lower_bound; 1, hish_bound: 2)構造体ができている' do
    # let!(:close_set) { Sample.new(low_bound: 1, high_bound: 2) }
    describe 'low_boundが入っている' do
      it do
        close_set = Sample.new(low_bound: 1, high_bound: 2)
        expect(close_set.low_bound).to eq 1
      end
    end
    describe 'high_boundが入っている' do
      it do
        close_set = Sample.new(low_bound: 1, high_bound: 2)
        expect(close_set.high_bound).to eq 2
      end
    end

    describe '数字以外が入ると' do
      it 'エラーが出る' do
        expect { Sample.new(low_bound: 'hoge', high_bound: 'huga') }.to raise_error(ArgumentError)
      end
    end

    describe 'low_bound>high_boundの時' do
      it 'エラーが出る' do
        expect { Sample.new(low_bound: 2, high_bound: 1) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#get_str' do
    describe 'get_strを読むと' do
      it '文字列が返ってくる' do
        close_set = Sample.new(low_bound: 1, high_bound: 2)
        expect(close_set.get_str.to_a?).to eq 'String'
      end
    end
  end
end
