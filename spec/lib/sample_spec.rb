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
  describe '構造体ができている' do
    let!(:close_set) { Sample.new(1, 2) }
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
  end
end
