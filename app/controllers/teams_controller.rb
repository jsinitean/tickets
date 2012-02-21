class TeamsController < ApplicationController

  layout 'admin'
  
  before_filter :confirm_logged_in
  
  def index
    list
    render('list')
  end
  
  def list
    @teams = Team.order("teams.position ASC")
  end
  
  def show
    @team = Team.find(params[:id])
  end
  
  def new
    @team = Team.new
    @team_count = Team.count + 1
  end
  
  def create
    new_position = params[:team].delete(:position)
    # Instantiate a new object using form parameters
    @team = Team.new(params[:team])
    # Save the object
    if @team.save
      @team.move_to_position(new_position)
      # If save succeeds, redirect to the list action
      flash[:notice] = "Team created."
      redirect_to(:action => 'list')
    else
      # If save fails, redisplay the form so user can fix problems
      @team_count = Team.count + 1
      render('new')
    end
  end
  
  def edit
    @team = Team.find(params[:id])
    @team_count = Team.count
  end
  
  def update
    new_position = params[:team].delete(:position)
    # Find object using form parameters
    @team = Team.find(params[:id])
    # Update the object
    if @team.update_attributes(params[:team])
      @team.move_to_position(new_position)
      # If update succeeds, redirect to the list action
      flash[:notice] = "Team updated."
      redirect_to(:action => 'show', :id => @team.id)
    else
      # If save fails, redisplay the form so user can fix problems
      @team_count = Team.count
      render('edit')
    end
  end
  
  def delete
    @team = Team.find(params[:id])
  end
  
  def destroy
    team = Team.find(params[:id])
    team.move_to_position(nil)
    team.destroy
    flash[:notice] = "Team destroyed."
    redirect_to(:action => 'list')
  end
  
end
