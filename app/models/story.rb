class Story < ActiveRecord::Base
  attr_accessible :number
  has_many :commits

end
