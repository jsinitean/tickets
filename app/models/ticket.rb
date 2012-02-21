require 'lib/position_mover'
class Ticket < ActiveRecord::Base
  
  include PositionMover
  
  belongs_to :team
  has_many :sections

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('tickets.game_at ASC')
  
  private
  
  def position_scope
    "tickets.team_id = #{team_id.to_i}"
  end
  
end
