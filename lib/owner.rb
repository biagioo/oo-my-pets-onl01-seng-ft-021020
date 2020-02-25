require 'pry'

class Owner
  
  attr_reader :species, :name
  @@all = [] 
  
  def initialize(name)
    @name = name
    @species = "human"
    save
  end 
  
  def say_species 
   "I am a #{@species}."  
  end 
  
  def save 
    @@all << self
  end 
  
  def self.all 
    @@all 
  end
  
  def self.count 
    self.all.size
  end 
  
  def self.reset_all 
    self.all.clear
  end 
  
  def cats 
    Cat.all.select{|c| c.owner == self}
  end 
  
  def dogs 
    Dog.all.select{|c| c.owner == self}
  end 
  
  def buy_cat(cat)
    Cat.new(cat, self)
  end 
  
  def buy_dog(dog)
    Dog.new(dog, self)
  end 
  
  def walk_dogs 
    dogs.select{|a| a.mood = "happy"}
  end 
  
  def feed_cats 
    cats.select{|a| a.mood = "happy"}
  end 
  
  def sell_pets 
    all_pets = dogs + cats 
    all_pets.select do |a|
      a.mood = "nervous"
      a.owner = nil
    end
  end 
  
  def list_pets
    "I have #{dogs.size} dog(s), and #{cats.size} cat(s)."
  end 
  
  
  
  
  
  
  
  
  
  
  
  
end