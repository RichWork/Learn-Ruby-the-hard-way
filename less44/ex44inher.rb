# Function defined in parent, not in child
class Parent

  def implicit()
    puts "PARENT implicit()"
  end
end

class Child < Parent
end

dad = Parent.new()
son = Child.new()

dad.implicit()
son.implicit()

# Ouput:
# PARENT implicit()
# PARENT implicit()
# Note that child has no functions but because it inherited from Parent, it has
# the implicit function. Handy to put shared functions in the Parent class

# Function defined in parent, overridden in child
class Parent

  def override()
    puts "PARENT override()"
  end
end

class Child < Parent
  def override()
    puts "CHILD override()"
  end
end

dad = Parent.new()
son = Child.new()

dad.override()
son.override()

# Ouput:
# PARENT override()
# CHILD override()
# Note that child override function overrides the Parent when the Child class is
# called. This allows functions specific to the Child to override the Parent if necessary

# Function defined in parent, overridden in child, with a call to the parent
class Parent

  def altered()
    puts "PARENT altered()"
  end
end

class Child < Parent
  def altered()
    puts "CHILD, BEFORE PARENT altered()"
    super()
    puts "CHILD, AFTER PARENT altered()"
  end
end

dad = Parent.new()
son = Child.new()

dad.altered()
son.altered()

# Ouput:
# PARENT altered()
# CHILD, BEFORE PARENT altered()
# PARENT altered()
# CHILD, AFTER PARENT altered()
# Note that child override function overrides the Parent when the Child class is
# called. Then super() calls the Parent class, as the heirachy is remembered.
