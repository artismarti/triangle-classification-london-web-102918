require "pry"
class Triangle
  attr_accessor :side1, :side2, :side3
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if (triangle? && isosceles?)
      :isosceles
    elsif (triangle? && equilateral?)
      :equilateral
    elsif (triangle? && scalene?)
      :scalene
    else
      begin
        raise TriangleError
      end
    end
  end

  def triangle?
    sum_of_sides = ((@side1 + @side2) > @side3) && ((@side1 + @side3) > @side2) && ((@side2 + @side3) > @side1)
    no_zero_sides = (@side1 > 0) && (@side2 > 0) && (@side3 > 0)
    sum_of_sides && no_zero_sides
  end

  def equilateral?
    ((@side1 == @side2) && (@side2 == @side3))
  end

  def isosceles?
    ((@side1 == @side2) && !(@side1 == @side3)) || ((@side1 == @side3) && !(@side1 == @side2)) || ((@side2 == @side3) && !(@side1 == @side2))
  end

  def scalene?
    !(@side1 == @side2) && !(@side2 == @side3)
  end

  class TriangleError < StandardError
  end

end

# Pry.start
