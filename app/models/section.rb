#require 'lib/position_mover'
class Section < ActiveRecord::Base

  #include PositionMover

  belongs_to :ticket
  
  CONTENT_TYPES = ['text', 'HTML']
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('sections.name ASC, sections.seat ASC')
  
  private
  
  def position_scope
    "sections.tickets_id = #{ticket_id.to_i}"
  end
  
end
