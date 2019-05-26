class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    # returns all classifications (FAILED - 8)
  end

  def self.longest
    # returns the classifications for the longest boat (FAILED - 9)
  end

end
