class CloseSet
  # setってrubyにあるらしい。それの拡張クラスみたいになっちゃうので、名前を変えると嬉しいかも
  attr_reader :low_bound, :high_bound

  def initialize(low_bound:, high_bound:)
    raise ArgumentError unless low_bound.is_a?(Integer) && high_bound.is_a?(Integer)
    raise ArgumentError if low_bound > high_bound

    @low_bound = low_bound
    @high_bound = high_bound
  end

  def get_close_set_str
    "[#{@low_bound},#{@high_bound}]"
  end

  def includes_num?(num)
    num >= @low_bound && num <= @high_bound
  end

  def is_same?(another_close_set)
    # falseを返すべきか、エラーを返すべきか悩む
    # どう振る舞うべきかは仕様にすべきだし、テストに書くべき
    raise ArgumentError if another_close_set.class != self.class

    low_bound_is_same = @low_bound == another_close_set.low_bound
    high_bound_is_same = @high_bound == another_close_set.high_bound

    low_bound_is_same && high_bound_is_same
  end

  def is_proper_subset?(another_close_set)
    raise ArgumentError if another_close_set.class != self.class

    is_lower_bound_included = @low_bound <= another_close_set.low_bound
    is_higher_bound_included = another_close_set.high_bound <= @high_bound

    is_lower_bound_included && is_higher_bound_included
  end
end
