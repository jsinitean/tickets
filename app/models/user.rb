class User < ActiveRecord::Base
  attr_accessible :game
  attr_accessible :date
  attr_accessible :name
  attr_accessible :email
  attr_accessible :content
end
