# All functions defined in one class
class Other

  def override()
    puts "OTHER override()"
  end

  def implicit()
    puts "OTHER implicit()"
  end

  def altered()
    puts "OTHER altered()"
  end

end

# Child does not inherit from Other, instead instances the class Other as the
# initialize and runs the functions from it
class Child

  def initialize()
    @other = Other.new()
  end

  def implicit()
    @other.implicit()
  end

  def override()
    puts "CHILD override()"
  end

  def altered()
    puts "CHILD, BEFORE OTHER altered()"
    @other.altered()
    puts "CHILD, AFTER OTHER altered()"
  end
end

# Note that Child takes the Other class during initialize
son = Child.new()

son.implicit()
son.override()
son.altered()

# Ouput:
# OTHER implicit()
# CHILD override()
# CHILD, BEFORE OTHER altered()
# OTHER altered()
# CHILD, AFTER OTHER altered()
# Note that this method avoids inheritance, instead running different functions.
# Inheritance has some uses but as the code length is usually the same, composition
# is generally safer and better.
