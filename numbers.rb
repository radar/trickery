class Integer
  alias_method :old_plus, :+
  alias_method :old_multiply, :*

  # 2 + 2 = 6
  def +(num)
    old_plus(old_plus(num))
  end

  # 3 * 3
  def *(num)
    m = method(:old_multiply).unbind
    m.bind(3).(num / self)
  end

  # a = -5
  # -a == -5
  def -@
    +(self)
  end
end
