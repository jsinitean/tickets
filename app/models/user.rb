class User < ActiveRecord::Base
  attr_accessible :game
  attr_accessible :date
  attr_accessible :name
  attr_accessible :email
  attr_accessible :content
  attr_accessible :ticket_id
  attr_accessible :sections
end
