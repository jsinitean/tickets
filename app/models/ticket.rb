#require 'lib/position_mover'
class Ticket < ActiveRecord::Base
  
  #include PositionMover
  
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
  
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['team_id = ?', 'game_at >= ?', 'game_at <= ?'])
  end
  
end
