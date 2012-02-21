class SectionsController < ApplicationController

  layout 'admin'
  
  before_filter :confirm_logged_in
  before_filter :find_ticket
  
  def index
    list
    render('list')
  end
  
  def list
    @sections = Section.sorted.where(:ticket_id => @ticket.id)
  end
  
  def show
    @section = Section.find(params[:id])
  end
  
  def new
    @section = Section.new(:ticket_id => @ticket.id)
    @section_count = @ticket.sections.size + 1
    @tickets = Ticket.order('position ASC')
  end
  
  def create
    new_position = params[:section].delete(:position)
    @section = Section.new(params[:section])
    if @section.save
      @section.move_to_position(new_position)
      flash[:notice] = "Section created."
      redirect_to(:action => 'list', :ticket_id => @section.ticket_id)
    else
      @section_count = @ticket.sections.size + 1
      @tickets = Ticket.order('position ASC')
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = @ticket.sections.size
    @tickets = Ticket.order('position ASC')
  end
  
  def update
    new_position = params[:section].delete(:position)
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:section])
      @section.move_to_position(new_position)
      flash[:notice] = "Section updated."
      redirect_to(:action => 'show', :id => @section.id, :ticket_id => @section.ticket_id)
    else
      @section_count = @ticket.sections.size
      @tickets = Ticket.order('position ASC')
      render('edit')
    end
  end
  
  def delete
    @section = Section.find(params[:id])
  end
  
  def destroy
    section = Section.find(params[:id])
    section.move_to_position(nil)
    section.destroy
    flash[:notice] = "Section destroyed."
    redirect_to(:action => 'list', :ticket_id => @ticket.id)
  end

  private
  
  def find_ticket
    if params[:ticket_id]
      @ticket = Ticket.find_by_id(params[:ticket_id])
    end
  end
  
end
