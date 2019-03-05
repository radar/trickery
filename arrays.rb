module JSSort
  def self.included(base)
    base.alias_method :old_sort, :sort
  end

  def sort
    if first.is_a?(Numeric)
      self.map(&:to_s).old_sort.map(&:to_i)
    else
      self.old_sort
    end
  end
end

Array.include(JSSort)
Range.include(JSSort)


class Array
  alias_method :old_double_plus, :==

  def ==(other)
    other.length > 3 ? "maybe" : (method(:old_double_plus).call(other) ? "yes" : "no")
  end

  def ===(other)
    true
  end

  def -@
    self.clear
  end

  def +@
    replace flat_map { |x| [x] * 10 }
    self
  end

  def !@
    map { |x| rand(100) }
  end

  def ~
   shuffle
  end

  def !=(other)
    "can't say, tbqh"
  end
end

class Range
  def ~
    to_a.shuffle
  end
end
