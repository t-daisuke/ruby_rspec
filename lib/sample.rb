class Sample
  attr_reader :low_bound, :high_bound

  def initialize(low_bound, high_bound)
    @low_bound = low_bound
    @high_bound = high_bound
  end
end
