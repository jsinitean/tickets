class PublicController < ApplicationController

  layout 'public'
  
  before_filter :setup_navigation
  before_filter :find_ticket
  before_filter :find_team
  before_filter :index
  before_filter :contact
  
  def index
    @teams = Team.visible.sorted
  end

  private
  
  def setup_navigation
    @teams = Team.visible.sorted
  end
  
  def find_team
    if params[:team_id]
      @team = Team.find_by_id(params[:team_id])
      @teams = Team.visible.sorted
    end
  end
  
  def find_ticket
    if params[:team_id]
      @ticket = Ticket.find_by_team_id(params[:team_id])
    end
  end
  
  def contact
    @admin_users = AdminUser.sorted
  end
  
end
