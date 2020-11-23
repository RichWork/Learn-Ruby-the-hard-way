## Animal is-a object look at the extra credit
class Animal
  def legs
    puts 4
  end
end

## Dog is-a Animal, Dog takes class animal attributes
class Dog < Animal

  def initialize(name)
    ## Dog has-a name, becomes object
    @name = name
  end
end

## Cat is-a animal
class Cat < Animal
  def tail?
    true
  end
end
