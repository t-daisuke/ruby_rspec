class Sample
  attr_reader :low_bound, :high_bound

  def initialize(low_bound:, high_bound:)
    raise ArgumentError unless low_bound.is_a?(Integer) && high_bound.is_a?(Integer)
    raise ArgumentError if low_bound > high_bound

    @low_bound = low_bound
    @high_bound = high_bound
  end

  def get_str
    "[#{@low_bound},#{@high_bound}]"
  end
end
