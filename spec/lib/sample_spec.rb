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
end
