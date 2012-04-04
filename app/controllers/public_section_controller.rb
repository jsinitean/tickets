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
          @sections = Section.visible.sorted.where(:tickets_id => @ticket.id)
      end

  end
