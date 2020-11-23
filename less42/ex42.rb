## Animal is-a object look at the extra credit
class Animal
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

  def initialize(name)
    ## Cat has-a name
    @name = name
  end
end

## Person has-a initialize which takes a name
class Person

  def initialize(name)
    ## Person has-a name
    @name = name

    ## Person has-a pet of some kind
    @pet = nil
  end

  attr_accessor :pet
end

## Employee is-a Person
class Employee < Person

  def initialize(name, salary)
    ## use the Person initialize method with the name parameter
    super(name) # super() runs the initialize method in the Person class
    ## Person has-a salary
    @salary = salary
  end

end

## Fish is-a Object
class Fish
end

## Salmon is-a fish
class Salmon < Fish
end

## Halibut is-a Fish
class Halibut < Fish
end


## rover is-a Dog
rover = Dog.new("Rover")

## stan is-a Cat
stan = Cat.new("Stan")

## mary is-a Person
mary = Person.new("Mary")

## mary has-a pet, which is-a cat, which is an animal, which has-a name stan
mary.pet = stan

## frank is-a employee, and has-a name frank, and has-a salary 120000
frank = Employee.new("Frank", 120000)

## frank has-a pet, which is a dog, which is an animal, which has-a name rover
frank.pet = rover

## flipper is-a fish
flipper = Fish.new()

## crouse is-a salmon
crouse = Salmon.new()

## harry is-a Halibut
harry = Halibut.new()
