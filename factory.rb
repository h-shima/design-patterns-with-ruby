# factory pattern はどの製品とどの製品を組み合わせることが可能なのか、という知識をカプセル化するイメージ。正しいクラスを選び出す
# 一方で builder pattern は複雑なオブジェクトを構築することに焦点を合わせたパターン

class Lily
  def initialize(name)
    @name = name
  end

  def grow
    puts "スイレン #{@name} は陽の光を浴びて育ちます"
  end
end

class Frog
  def initialize(name)
    @name = name
  end

  def eat
    puts "カエル #{@name} は食事中です"
  end

  def speak
    puts "カエル #{@name} がガーガー鳴いています"
  end

  def sleep
    puts "カエル #{@name} は静かに眠っています"
  end
end

class Habitat
  def initialize(number_animals, number_plants, organizm_factory)
    @organizm_factory = organizm_factory

    @animals = []
    number_animals.times do |i|
      animal = @organizm_factory.new_animal("動物#{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = @organizm_factory.new_plant("植物#{i}")
      @plants << plant
    end
  end

  def simulate_one_day
    @plants.each(&:grow)
    @animals.each(&:eat)
    @animals.each(&:speak)
    @animals.each(&:sleep)
  end
end

class OrganizmFactory
  def initialize(plant_class, animal_class)
    @plant_class = plant_class
    @animal_class = animal_class
  end

  def new_animal(name)
    @animal_class.new(name)
  end

  def new_plant(name)
    @plant_class.new(name)
  end
end

# LilyとFrogの取り合わせは正しい、という知識をカプセル化している
pond_organizm = OrganizmFactory.new(Lily, Frog)
pond = Habitat.new(1, 2, pond_organizm)
pond.simulate_one_day
