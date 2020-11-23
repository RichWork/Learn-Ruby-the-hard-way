# All functions defined in one module
module Other

  def override()
    puts "OTHER override()"
  end

  def implicit()
    puts "OTHER implicit()"
  end

# Note that if a function name has been overwritten, then require the module name
  def Other.altered()
    puts "OTHER altered()"
  end

end

# Child takes the functions from the Other module, note there is no initialize
# Note that Child.implicit() is also missing as it can call the module implicit instead
class Child
  include Other # code to include or require a module

  def override() # Note that despite the module.override, this still overrides
    puts "CHILD override()"
  end

  def altered()
    puts "CHILD, BEFORE OTHER altered()"
    Other.altered() # Note this calls the function with the Other.altered name
    puts "CHILD, AFTER OTHER altered()"
  end
end

# Note that Child takes the Other class during initialize
son = Child.new()

son.implicit() # Note, this calls the module implicit function
son.override()
son.altered()

# Ouput:
# OTHER implicit()
# CHILD override()
# CHILD, BEFORE OTHER altered()
# OTHER altered()
# CHILD, AFTER OTHER altered()
# Note that this method also avoids inheritance, instead running different functions
# from a module. This method of module and class is called a mixin, and is apparently
# powerful but not covered here.
