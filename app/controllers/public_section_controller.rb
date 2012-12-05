class PublicSectionController < ApplicationController

      layout 'public'

      before_filter :setup_navigation
      before_filter :find_ticket
      before_filter :show

      def index
        # intro text
      end

      private

      def setup_navigation
        @teams = Team.visible.sorted
      end

      def find_ticket
        if params[:ticket_id]
          @ticket = Ticket.find_by_id(params[:ticket_id])
        end
      end

      def show
          @sections = Section.visible.sorted.where(:ticket_id => @ticket.id)
      end

      def list
          @sections = Section.visible.sorted.where(:ticket_id => @ticket.id)
      end
      
      def send_mail
        UserMailer.registration_confirmation(@user).deliver
        flash[:notice] = "Section updated."
        redirect_to(:action => 'show', :id => @section.id, :ticket_id => @section.ticket_id)
      end
      
  end
