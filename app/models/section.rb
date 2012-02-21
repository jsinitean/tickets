require 'lib/position_mover'
class Section < ActiveRecord::Base

  include PositionMover

  belongs_to :ticket
  
  CONTENT_TYPES = ['text', 'HTML']
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('sections.position ASC')
  
  private
  
  def position_scope
    "sections.ticket_id = #{ticket_id.to_i}"
  end
  
end
