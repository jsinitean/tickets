#require 'lib/position_mover'
class Ticket < ActiveRecord::Base
  
  #include PositionMover
  
  belongs_to :team
  has_many :sections
  belongs_to :opposing_teams

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  
  default_scope order('game_at ASC')
  
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :dated, where('game_at > CURRENT_TIMESTAMP AND visible = true')
  scope :admin, where('game_at > CURRENT_TIMESTAMP ')
  
  
  def self.show
      where(
          'tickets.game_at > CURRENT_TIMESTAMP' ,'visible => false'
      )
  end

  
end
