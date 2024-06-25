class OpenSet < CloseSet
  attr_reader :low_bound, :high_bound

  def initialize(low_bound:, high_bound:)
    super
  end
end
