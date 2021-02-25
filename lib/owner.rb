class Owner
  attr_reader :name, :species 
   @@all=[]
    def initialize(name) 
      @name = name 
      @species = "human"
      self.class.all << self
    end
#methods
    def self.species
      @species
    end

    def say_species
      "I am a #{self.species}."
    end

    def self.all
      @@all
    end

    def self.count
      self.all.count
    end

    def self.reset_all
      self.all.clear
    end
#methods    
#cat
    def cats
      Cat.all.select {|cat| cat.owner == self}
    end

    def buy_cat(name)
      cats << Cat.new(name, self)
    end

    def feed_cats
      self.cats.map{|cat| cat.mood="happy"}
    end
#cat
#dog
    def dogs
      Dog.all.select {|dog| dog.owner == self}
    end

    def buy_dog(name)
      dogs << Dog.new(name, self)
    end
    
    def walk_dogs
      self.dogs.map{|dog| dog.mood="happy"}
    end
#dog
#pets
    def pets
      pets = self.dogs.concat(self.cats)
    end
    def sell_pets
    pets.map{|pet| pet.mood= "nervous"; pet.owner = nil}
    end
    def list_pets
      "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    end
#pets    
end