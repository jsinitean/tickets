class TicketsController < ApplicationController

  layout 'admin'

  before_filter :confirm_logged_in
  before_filter :find_ticket
  
  def index
    list
    render('list')
  end
  
  def list
    @tickets = Ticket.sorted.where(:team_id => @team.id)
  end
  
  def show
    @ticket = Ticket.find(params[:id])
  end
  
  def new
    @ticket = Ticket.new
    @ticket_count = Ticket.count + 1
    @teams = Team.order('position ASC')
  end
  
  def create
    new_position = params[:ticket].delete(:position)
    # Instantiate a new object using form parameters
    @ticket = Ticket.new(params[:ticket])
    # Save the object
    if @ticket.save
      # If save succeeds, redirect to the list action
      flash[:notice] = "Ticket created."
      redirect_to(:action => 'list', :team_id => @ticket.team_id)
    else
      # If save fails, redisplay the form so user can fix problems
      @ticket_count = @team.tickets.size + 1
      @teams = Team.order('position ASC')
      render('new')
    end
  end
  
  def edit
    @ticket = Ticket.find(params[:id])
    @ticket_count = Ticket.count
    @teams = Team.order('position ASC')
  end
  
  def update
    new_position = params[:ticket].delete(:position)
    # Find object using form parameters
    @ticket = Ticket.find(params[:id])
    # Update the object
    if @ticket.update_attributes(params[:ticket])
      # If update succeeds, redirect to the list action
      flash[:notice] = "Ticket updated."
      redirect_to(:action => 'show', :id => @ticket.id, :team_id => @ticket.team_id)
    else
      # If save fails, redisplay the form so user can fix problems
      @ticket_count = @team.tickets.size
      @teams = Team.order('position ASC')
      render('edit')
    end
  end
  
  def delete
    @ticket = Ticket.find(params[:id])
  end
  
  def destroy
    ticket = Ticket.find(params[:id])
    ticket.destroy
    flash[:notice] = "Ticket destroyed."
    redirect_to(:action => 'list', :team_id => @team.id)
  end
  
  private
  
  def find_ticket
    if params[:team_id]
      @team = Team.find_by_id(params[:team_id])
    end
  end
  
  def find_team
    if params[:team_id]
      @team = Team.find_by_id(params[:team_id])
    end
  end
    
end
