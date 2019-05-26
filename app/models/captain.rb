class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    Captain.joins(boats: :classifications).where(classifications: {name: "Catamaran"})
  end

  def self.sailors
    sailboat = Classification.find_by(name:"Sailboat")
    Captain.select do |captain|
      captain.boats.detect {|boat| boat.classifications.include?(sailboat)}
    end
  end

  def self.talented_seafarers
    sailboat = Classification.find_by(name:"Sailboat")
    motorboat = Classification.find_by(name:"Motorboat")
    Captain.select do |captain|
      captain.boats.detect do |boat|
        boat.classifications.include?(sailboat) &&
        boat.classifications.include?(motorboat)
      end
    end
  end

  def self.non_sailors
    Captain.joins(boats: :classifications).where.not("classifications.name = 'Sailboat'").distinct
  end
end
