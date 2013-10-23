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
          @user = User.new
          @sections = Section.visible.where(:ticket_id => @ticket.id)
          respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @user }
          end
      end

      def list
          @sections = Section.visible.sorted.where(:ticket_id => @ticket.id)
      end
      
      def send_mail
        UserMailer.registration_confirmation(@user).deliver
        flash[:notice] = "Section updated."
        redirect_to(:action => 'show', :id => @section.id, :ticket_id => @section.ticket_id)
      end
      
      def create
        @user = User.new(params[:user])
        respond_to do |format|
          if @user.save
            UserMailer.send_email(@user).deliver
            format.html { redirect_to @user, notice: 'A ticket request email has been submitted and you will receive a response shortly.' }
            format.json { render json: @user, status: :created, location: @user }
          else
            format.html { render action: "new" }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end
      
  end
