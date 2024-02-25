class ReservationsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
  
    def new
        @room = Room.find(params[:room_id])
        @reservation = Reservation.new
      rescue ActiveRecord::RecordNotFound
        raise ActionController::RoutingError, 'Room not found'
    end
    
    
      def create

        @reservation = Reservation.new(reservation_params)
        @reservation.user_id = current_user.id

        @reservation.total_price = calculate_total_price(@reservation)
        @reservation.save

        if @reservation.save
          redirect_to reservations_path
        else
          render :confirm
        end

      end

      def confirm
        
        @reservation = Reservation.new(reservation_params)
        @room = Room.find(params[:reservation][:room_id])
        @reservation.room_id = @room.id
        # @reservation.total_price = calculate_total_price(@reservation)
        @total_price = @room.price * @reservation.people_count * (@reservation.check_out_at.to_date - @reservation.check_in_at.to_date).to_i
      end

      def back
        @reservation = Reservation.new(reservation_params)
        render :new
      end

      def index
        # @room = Room.find(params[:room_id])
      
        @reservations = Reservation.includes(:room).all
        @reservations.each do |reservation|
          calculate_total_price(reservation)
        end

      end
    
      def show
        @reservation = Reservation.find(params[:id])
        @total_price = @reservation.total_price
        @room = Room.find(@reservation.room_id)
      end
    
      private
    
      def reservation_params
        params.require(:reservation).permit(:check_in_at, :check_out_at, :people_count, :room_id, :total_price)
      end
    
      def calculate_total_price(reservation)
        room = Room.find(reservation.room_id)
        reservation.total_price = (room.price * reservation.people_count * (reservation.check_out_at.to_date - reservation.check_in_at.to_date).to_i).floor
       
      end

  end
  