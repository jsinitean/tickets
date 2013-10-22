#require 'lib/position_mover'
class Ticket < ActiveRecord::Base
  
  #include PositionMover
  
  belongs_to :team
  has_many :sections
  belongs_to :opposing_teams

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  
  scope :visible, where('visible = 1')
  scope :invisible, where(:visible => false)
  scope :sorted, order('tickets.game_at ASC')
  scope :dated, where('tickets.game_at > now()')
  scope :show, where('tickets.game_at > now() AND tickets.visible = 1')
  
  def position_scope
    "tickets.team_id = #{team_id.to_i}"
  end


  
end
