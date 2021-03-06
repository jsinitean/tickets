class SectionsController < ApplicationController

  layout 'admin'
  
  before_filter :confirm_logged_in
  before_filter :find_ticket
  before_filter :setup_navigation
  
  def index
    list
    render('list')
  end
  
  def setup_navigation
    @teams = Team.visible.sorted
  end
  
  def list
    @sections = Section.unscoped.where(:ticket_id => @ticket.id)
  end
  
  def show
    @section = Section.unscoped.find(params[:id])
  end
  
  def new
    @section = Section.new(:ticket_id => @ticket.id)
    @tickets = Ticket.order('game_at ASC')
  end
  
  def create
    new_position = params[:section].delete(:position)
    @section = Section.new(params[:section])
    if @section.save
      flash[:notice] = "Section created."
      redirect_to(:action => 'list', :ticket_id => @section.ticket_id)
    else
      @tickets = Ticket.order('game_at ASC')
      render('new')
    end
  end

  def edit
    @section = Section.unscoped.find(params[:id])
    @tickets = Ticket.order('game_at ASC')
  end
  
  def update
    new_position = params[:section].delete(:position)
    @section = Section.unscoped.find(params[:id])
    if @section.update_attributes(params[:section])
      flash[:notice] = "Section updated."
      redirect_to(:action => 'show', :id => @section.id, :ticket_id => @section.ticket_id)
    else
      @section_count = @ticket.sections.size
      @tickets = Ticket.order('game_at ASC')
      render('edit')
    end
  end
  
  def delete
    @section = Section.find(params[:id])
  end
  
  def destroy
    section = Section.find(params[:id])
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
