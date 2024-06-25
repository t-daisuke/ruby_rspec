class OpenSet < CloseSet
  attr_reader :low_bound, :high_bound

  def initialize(low_bound:, high_bound:)
    super
  end

  def get_open_set_str
    "(#{@low_bound},#{@high_bound})"
  end
end
