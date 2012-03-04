class OpposingTeams < ActiveRecord::Base
  
  has_many :tickets
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  # validates_presence_of vs. validates_length_of :minimum => 1
  # different error messages: "can't be blank" or "is too short"
  # validates_length_of allows strings with only spaces!
  
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('opposing_teams.name DESC')
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
